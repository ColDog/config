#!/usr/bin/env python3.6

import io
import os
import subprocess
import optparse
import inspect
import sys
import functools

targets = {}

def target(func):
    opts = inspect.getargspec(func).args

    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        return func(*args, **kwargs)
    targets[wrapper.__name__] = {
        'func': wrapper,
        'opts': opts or [],
    }
    return wrapper


def sh(*cmd, env=None, capture=False, log=True):
    if log:
        print('$', ' '.join(cmd))
    stdout = None
    if capture:
        stdout = subprocess.PIPE
    p = subprocess.Popen(
        ' '.join(cmd),
        env=env,
        stdout=stdout,
        shell=True,
    )
    if p.wait() != 0:
        raise Exception('exit code {}'.format(p.returncode))
    if capture:
        return p.stdout.read()


def run():
    with open('manage.py') as f:
        exec(f.read())

    try:
        arg = sys.argv[1]
        call = targets[arg]
    except (KeyError, IndexError):
        print('target not found', file=sys.stderr)
        sys.exit(1)

    parser = optparse.OptionParser()
    for name in targets[arg]['opts']:
        parser.add_option('--' + name)

    opts, _ = parser.parse_args()

    try:
        targets[arg]['func'](**opts.__dict__)
    except Exception as e:
        print('target failed: ' + str(e), file=sys.stderr)
        sys.exit(1)

run()
