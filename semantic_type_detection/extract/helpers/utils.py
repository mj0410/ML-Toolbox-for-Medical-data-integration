import re
import os
import base64
import hashlib
import pandas as pd

def canonical_header(h):
    h = str(h)
    h = re.sub(r'\([^)]*\)', '', h)
    h = h.split('.')[0].lower()
    h = re.sub(r"[0-9]", '', h)
    words = list(filter(lambda x: len(x)>0, map(lambda x: x.lower(), re.split(' ', h))))
    if len(words)<=0:
        return '-'
    new_phrase = ''.join([words[0]] + [x.capitalize() for x in words[1:]])
    return new_phrase

def long_name_digest(name, n = 10):
    return base64.b32encode(hashlib.sha1(name.encode()).digest()[:n]).decode("utf-8")

# Iterator for reading large header file.
def valid_header_iter_gen(file_name):

    valid_header_dir = os.path.join(os.environ['BASEPATH'], 'extract', 'out', 'headers')

    valid_header_loc = os.path.join(valid_header_dir, file_name)    
    df_header = pd.read_csv(valid_header_loc)

    for chunk in df_header:
        for row in chunk.iterrows():
            yield row
    yield "EOF"

def count_length_gen(file_name):
    # count the numbers of lines in a file
    # Note: mannually -1 if there's header
    df = pd.read_pickle(file_name)
    return(len(df))

