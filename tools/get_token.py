#!/usr/bin/python
from base64 import b64encode  # , b64decode
import sys


def get_code(login, password):
    auth_token = '{login}:{password}'.format(login=login, password=password).encode()
    return b64encode(auth_token)


def main(argv):
    print(get_code(argv[0], argv[1]))


if __name__ == "__main__":
    main(sys.argv[1:])
