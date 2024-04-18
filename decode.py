import sys

import codecs

if len(sys.argv) != 2:
    raise RuntimeError("usage: python decode.py <encoded_worker_message>")

s = str(sys.argv[1])

ss = ""

for byte in s.split():
    tmp = str(hex(int(byte) ^ 100))[2:]
    tmp_bytes = bytes(tmp, encoding='utf-8')
    tmp_bin = str(codecs.decode(tmp_bytes, "hex"))
    ss += str(tmp_bin.split('\'')[1])

print(ss)