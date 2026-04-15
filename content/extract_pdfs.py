import subprocess, sys, os

# Install pypdf if needed
try:
    import pypdf
except ImportError:
    subprocess.check_call([sys.executable, '-m', 'pip', 'install', 'pypdf', '-q'])
    import pypdf

base = r'G:\My Drive\Obsidian Notebook\Neurodivergent Research Group\wiki\raw'
files = [
    'parker-et-al-2024-the-identification-and-documentation-of-on-site-sensory-and-multisensory-experience-a-methodological.pdf',
    'NAIT-Guide-to-Assessment-of-Sensory-Preferences-in-Adults-2022.pdf',
    '1-s2.0-S2666374025000597-main.pdf',
    'dark-2025-inclusion-by-design-a-neuro-cognitive-trait-interaction-approach-to-neurodivergent-research.pdf',
    'Sensory_Responsive_Environments_A_Qualitative_Stud.pdf',
]

for fname in files:
    path = os.path.join(base, fname)
    print(f'===== FILE: {fname} =====')
    try:
        reader = pypdf.PdfReader(path)
        max_pages = min(20, len(reader.pages))
        print(f'Total pages: {len(reader.pages)}, reading first {max_pages}')
        for i in range(max_pages):
            text = reader.pages[i].extract_text()
            if text:
                print(f'--- Page {i+1} ---')
                print(text)
    except Exception as e:
        print(f'ERROR: {e}')
    print()
