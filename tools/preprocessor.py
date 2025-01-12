#!/usr/bin/python3

import os
import pathlib
import random
import re
import string
import subprocess
import sys

def show_help():
    help_message = """\
Preprocess any \`{{{ <bash-command> }}}\` occurrence evaluating the bash code
inside the tag and replacing it with the command output.

It list the temporary file names preprocessed.

Usage: ./prepocessor.py <filename> [filename ...]

Example:
    do_something_with_the_files \$(./prepocessor.py my-file.md)
"""

    print(help_message)

def main():
    if len(sys.argv) < 2 or sys.argv[1] == "-h" or sys.argv[1] == "--help":
        show_help()
        sys.exit(0)

    for file in sys.argv[1:]:
        if not os.path.isfile(file):
            print(f"File '{file}' not found!", file=sys.stderr)
            sys.exit(1)

        tempfile = preprocess(file)
        print(tempfile)

def preprocess(filename: str) -> str:
    with open(filename, 'r') as file:
        content = file.read()

    pattern = r'\{\{\{(.*?)\}\}\}'

    def execute_bash_code(match):
        bash_code = match.group(1).strip()
        try:
            result = subprocess.check_output(bash_code, shell=True, stderr=subprocess.PIPE)
            return result.decode('utf-8').strip()
        except subprocess.CalledProcessError as e:
            return f"Error executing bash code: {e}"

    updated_content = re.sub(pattern, execute_bash_code, content)

    filename_extension = pathlib.Path(filename).suffix
    tempfilename = (
        '/tmp/'
        + ''.join(random.choices(string.ascii_letters + string.digits, k=16))
        + filename_extension
    )

    with open(tempfilename, 'w') as file:
        file.write(updated_content)

    return tempfilename


if __name__ == "__main__":
    main()
