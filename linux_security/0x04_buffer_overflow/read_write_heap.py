#!/usr/bin/python3
"""
Module to read and write to a process heap.
"""
import sys


def read_write_heap():
    """
    Finds and replaces a string in the heap of a process.
    """
    if len(sys.argv) != 4:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)

    pid = sys.argv[1]
    search_str = sys.argv[2]
    replace_str = sys.argv[3]

    maps_path = "/proc/{}/maps".format(pid)
    mem_path = "/proc/{}/mem".format(pid)

    try:
        start_addr = None
        end_addr = None
        with open(maps_path, 'r') as f:
            for line in f:
                if "[heap]" in line:
                    addr_range = line.split()[0].split('-')
                    start_addr = int(addr_range[0], 16)
                    end_addr = int(addr_range[1], 16)
                    break

        if start_addr is None or end_addr is None:
            sys.exit(1)

        with open(mem_path, 'rb+') as f:
            f.seek(start_addr)
            heap_data = f.read(end_addr - start_addr)

            try:
                index = heap_data.index(search_str.encode('ascii'))
            except ValueError:
                sys.exit(1)

            # String tapıldısa, həmin mövqeyə gedib yeni mətni yazırıq
            f.seek(start_addr + index)
            f.write(replace_str.encode('ascii'))

    except Exception:
        sys.exit(1)


if __name__ == "__main__":
    read_write_heap()
