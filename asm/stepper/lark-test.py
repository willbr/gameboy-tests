from lark import Lark
from lark import UnexpectedCharacters, UnexpectedToken

parse = Lark.open('grammar.lark', parser='lalr', debug=True).parse

if __name__ == "__main__":
    code = """
    stuff: ldb a 0x1234
    ld a 0b0101_0101
    ld a [adr1]
    ld hl [adr2]
    add a [hl]
    ld [adr3] a
    """

    print(code)

    try:
        tree = parse(code)
        print(tree.pretty())

        for line in tree.children:
            print(line.children)


    except UnexpectedToken as e:
        print(e)

    except UnexpectedCharacters as e:
        print(e)


