<#
.SYNOPSIS
  Publish the NRG Obsidian vault to the live Quartz site.

.DESCRIPTION
  One-way sync: the edit vault on G: is the source of truth. This script
    1. refuses to run if the Quartz content folder has uncommitted edits
       (someone edited the publish copy directly — fix that first),
    2. pulls origin/v4 (fast-forward only),
    3. fixes filename case changes git can't see on Windows,
    4. mirrors the vault into content\Neurodivergent Research Group (minus .obsidian),
    5. commits and pushes v4, which triggers the GitHub Pages deploy.

.PARAMETER DryRun
  Show what would be copied/deleted and the resulting git changes, then stop.

.PARAMETER Message
  Optional commit message (default: "publish: <timestamp>").

.EXAMPLE
  .\publish.ps1 -DryRun
  .\publish.ps1
  .\publish.ps1 -Message "publish: ingest Mostafa papers"
#>
param(
    [switch]$DryRun,
    [string]$Message
)

$ErrorActionPreference = 'Stop'

$Vault   = 'G:\My Drive\Obsidian Notebook\Neurodivergent Research Group'
$Repo    = $PSScriptRoot
$RelDest = 'content/Neurodivergent Research Group'
$Dest    = Join-Path $Repo $RelDest
$Branch  = 'v4'

function Invoke-Git {
    # Run git in the repo; throw on non-zero exit. git writes progress to stderr,
    # which PS 5.1 turns into terminating errors under 'Stop', so relax it here.
    $ErrorActionPreference = 'Continue'
    $out = & git -C $Repo @args
    if ($LASTEXITCODE -ne 0) { throw "git $($args -join ' ') failed (exit $LASTEXITCODE)" }
    $out
}

if (-not (Test-Path $Vault)) { throw "Vault not found: $Vault (is Google Drive running?)" }

# 1. Guard against direct edits to the publish copy.
$dirty = Invoke-Git status --porcelain -- $RelDest
if ($dirty) {
    Write-Host "Quartz content folder has uncommitted changes:" -ForegroundColor Red
    $dirty | ForEach-Object { Write-Host "  $_" }
    throw "Aborting. Move those edits into the vault (or discard them) before publishing."
}

# 2. Stay current with the remote.
$current = (Invoke-Git rev-parse --abbrev-ref HEAD).Trim()
if ($current -ne $Branch) { throw "Repo is on branch '$current', expected '$Branch'." }
Invoke-Git pull --ff-only origin $Branch | Out-Null

# 3. Case-only renames (e.g. IDEAS.md -> ideas.md) are invisible to robocopy and to
#    git with core.ignorecase=true, so rename tracked files to match the vault.
$srcFiles = Get-ChildItem -LiteralPath $Vault -Recurse -File -Force |
    Where-Object { $_.FullName -notmatch '\\\.obsidian(\\|$)' } |
    ForEach-Object { ($RelDest + '/' + $_.FullName.Substring($Vault.Length + 1)).Replace('\', '/') }
$srcByLower = @{}
foreach ($f in $srcFiles) { $srcByLower[$f.ToLowerInvariant()] = $f }
foreach ($t in (Invoke-Git -c core.quotepath=off ls-files -- $RelDest)) {
    $want = $srcByLower[$t.ToLowerInvariant()]
    if ($want -and $want -cne $t) {
        Write-Host "Case rename: $t -> $want"
        if (-not $DryRun) { Invoke-Git mv -f -- $t $want | Out-Null }
    }
}

# 4. Mirror vault -> Quartz content. /MIR deletes files removed from the vault.
$rc = @($Vault, $Dest, '/MIR', '/XD', '.obsidian', '/XF', 'desktop.ini', '/NP', '/NJH', '/NDL', '/FFT', '/R:2', '/W:2')
if ($DryRun) { $rc += '/L' }
& robocopy @rc
if ($LASTEXITCODE -ge 8) { throw "robocopy failed (exit $LASTEXITCODE)" }

if ($DryRun) {
    Write-Host "`nDry run: nothing copied, committed, or pushed." -ForegroundColor Yellow
    exit 0
}

# 5. Commit and push.
Invoke-Git add -A -- $RelDest | Out-Null
$staged = Invoke-Git diff --cached --name-status -- $RelDest
if (-not $staged) {
    Write-Host "Nothing changed; site already up to date." -ForegroundColor Green
    exit 0
}
Write-Host "`nChanges to publish:"
$staged | ForEach-Object { Write-Host "  $_" }

if (-not $Message) { $Message = "publish: $(Get-Date -Format 'yyyy-MM-dd HH:mm')" }
Invoke-Git commit -m $Message | Out-Null
Invoke-Git push origin $Branch | Out-Null

Write-Host "`nPushed to $Branch. GitHub Actions will deploy to https://shnlmn.github.io/nrg_db_quartz/ in a few minutes." -ForegroundColor Green
