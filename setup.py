#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
 * This file is part of the Quey Project
 * Copyright (C) 2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
"""
import argparse
from scripts import qrc
from scripts import install


def main():
    parser = argparse.ArgumentParser(description="Setup Quey UI", formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('command', type=str, nargs="?",
                        help=("Command\n"
                              "install\tInstall system wide.\n"
                              "submodule\tInstall as per-project submodule.\n"
                              "qrc\t\tCreate qrc wrapper\n"
                              "clean\tRuns 'make distclean'")
                        )
    parser.add_argument('-qmake', type=str, default='qmake',
                        help="Path to qmake executable. Defaults to 'qmake'.")
    parser.add_argument('-project', type=str, default='.',
                        help="Path to project folder. Defaults to '.'")

    args = parser.parse_args()

    if args.command == 'qrc':
        qrc.create_default_qrc()
    elif args.command == 'install':
        install.install_system_wide(args.qmake)
    elif args.command == 'submodule':
        if args.project == '.':
            print("No project path specified, using current directory.")
            print("Use '-project' to specify a project folder.")
        install.install_per_project(args.project)
    elif args.command == 'clean':
        install.distclean()
    else:
        print("Run 'setup.py -h' for usage instructions")

    print("Done")

if __name__ == '__main__':
    main()
