import re
import sys
import asyncio
from googletrans import Translator

async def translate_quotes():
    with open(r'C:\Users\PC\Desktop\antigravy painto gain\lib\backend\quotes_repository.dart', 'r', encoding='utf-8') as f:
        content = f.read()

    translator = Translator()

    # Find all Quote objects
    # We will look for localizedText: { ... }
    # Inside, we find 'en': '...' and use it to translate.
    
    # We need to find all blocks of localizedText
    pattern = re.compile(r"(localizedText:\s*\{)(.*?)(\},)", re.DOTALL)
    
    async def process_block(match):
        prefix = match.group(1)
        inner = match.group(2)
        suffix = match.group(3)
        
        # If already translated, skip
        if "'it':" in inner and "'pt':" in inner:
            return match.group(0)
            
        # Find English text
        en_match = re.search(r"'en':\s*'((?:\\'|[^'])*)'", inner)
        if not en_match:
            return match.group(0)
            
        en_text = en_match.group(1).replace("\\'", "'")
        
        try:
            # Translate to Italian and Portuguese
            it_trans = await translator.translate(en_text, dest='it')
            pt_trans = await translator.translate(en_text, dest='pt')
            
            it_text = it_trans.text.replace("'", "\\'")
            pt_text = pt_trans.text.replace("'", "\\'")
            
            # Append to inner
            new_inner = inner + f"      'it': '{it_text}',\n      'pt': '{pt_text}',\n"
            print(f"Translated: {en_text[:30]}...")
            return prefix + new_inner + suffix
        except Exception as e:
            print(f"Error translating: {e}")
            return match.group(0)

    # We can't use async re.sub, so we'll do it manually
    pos = 0
    new_content = ""
    for match in pattern.finditer(content):
        new_content += content[pos:match.start()]
        new_content += await process_block(match)
        pos = match.end()
    
    new_content += content[pos:]

    with open(r'C:\Users\PC\Desktop\antigravy painto gain\lib\backend\quotes_repository.dart', 'w', encoding='utf-8') as f:
        f.write(new_content)
        
    print("Translation completed successfully.")

if __name__ == '__main__':
    asyncio.run(translate_quotes())
