#!/usr/bin/python3
import sys
import os

def read_write_heap():
    if len(sys.argv) != 4:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)

    pid, search_str, replace_str = sys.argv[1], sys.argv[2], sys.argv[3]
    maps_path = f"/proc/{pid}/maps"
    mem_path = f"/proc/{pid}/mem"

    try:
        start_addr = end_addr = None
        with open(maps_path, 'r') as f:
            for line in f:
                if "[heap]" in line:
                    addr_range = line.split()[0].split('-')
                    start_addr, end_addr = int(addr_range[0], 16), int(addr_range[1], 16)
                    break
        
        if start_addr is None:
            sys.exit(1)

        with open(mem_path, 'rb+') as f:
            f.seek(start_addr)
            heap_data = f.read(end_addr - start_addr)
            
            try:
                index = heap_data.index(search_str.encode('ascii'))
            except ValueError:
                sys.exit(1)

            f.seek(start_addr + index)
            f.write(replace_str.encode('ascii'))
            
    except (PermissionError, Exception):
        sys.exit(1)

if __name__ == "__main__":
    read_write_heap()
