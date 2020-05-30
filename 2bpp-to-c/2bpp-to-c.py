import argparse
from pathlib import Path

INDENT = ' ' * 4
ELEMENTS_PER_LINE = 8


def main():
    parser = argparse.ArgumentParser(
        description="""
            bla bla bla
            """.strip(),)

    parser.add_argument('filenames', type=str, help='filename help', nargs='+')

    args = parser.parse_args()

    for filename in (Path(x) for x in args.filenames):
        create_header(filename)
        out_file = filename.parent.joinpath(filename.stem + '.h')


def create_header(path: Path):
    array_name = f"{path.stem}"
    guard_name = f"{path.stem.upper()}_H"

    body = []

    body.append(f"""
#ifndef {guard_name}
#define {guard_name}

const unsigned char {array_name}[] = {{
""".strip())

    with open('sprite.2bpp', 'rb') as f:
        data = f.read()
        data = range(255)

        i = 0
        while i < len(data):
            line = []
            for j in range(ELEMENTS_PER_LINE):
                offset = i + j
                if offset < len(data):
                    c = data[offset]
                    line.append(f"0x{c:02X}")
                    if offset < len(data) -1:
                        line.append(', ')

            body.append(INDENT + ''.join(line))
            i += j + 1

    body.append(f"""
    }};

#endif

    """.strip() + "\n")

    print('\n'.join(body))

if __name__ == '__main__':
    main()

