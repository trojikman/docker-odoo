#!/usr/bin/python
from base64 import b64encode  # , b64decode
import sys


def get_code(data):
    auth_token = 'openapi:{}'.format(data).encode()
    return b64encode(auth_token)


def main(argv):
    print(get_code(argv[0]))


if __name__ == "__main__":
    main(sys.argv[1:])
