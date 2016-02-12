#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
 * This file is part of the Quey Project
 * Copyright (C) 2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
"""

import argparse
import getpass
import os
import os.path
import subprocess

DEFAULT_QT_PATH = "/home/{}/Qt".format(getpass.getuser())
DEFAULT_QT_DOCS_PATH = "$QTPATH/Docs/Qt-$QTVERSION"
DEFAULT_QT_QDOC_PATH = "$QTPATH/$QTVERSION/gcc_64/bin/qdoc"
DEFAULT_QT_VERSION = "5.5"
DEFAULT_QDOC_CONF = "quey-ui.qdocconf"


def verify_installation(args):
    print("Qt path: '{}'".format(args.qtpath))
    if args.qtpath == DEFAULT_QT_PATH:
        print("Run with --qtpath QTPATH to specify Qt installation path")
    assert os.path.exists(args.qtpath), "Error: Qt path doesn't exist"

    print("Qt version: '{}'".format(args.qtversion))
    if args.qtversion == DEFAULT_QT_VERSION:
        print("Run with --qtversion QTVERSION to specify Qt version")
    assert os.path.exists(args.qtpath), "Error: Qt path doesn't exist"

    qtdocspath = args.qtdocspath.replace("$QTPATH", args.qtpath).replace("$QTVERSION", args.qtversion)
    print("Qt docs path: '{}'".format(qtdocspath))
    if args.qtdocspath == DEFAULT_QT_DOCS_PATH:
        print("Run with --qtdocspath QTDOCSPATH to specify Qt docs installation path")
    assert os.path.exists(qtdocspath), "Error: Qt docs path doesn't exist"

    qdocexec = args.qdocexec.replace("$QTPATH", args.qtpath).replace("$QTVERSION", args.qtversion)
    print("Qt qdoc exec path: '{}'".format(qdocexec))
    if args.qdocexec == DEFAULT_QT_QDOC_PATH:
        print("Run with --qdocexec QDOCEXEC to specify qdoc executable path")
    assert os.path.exists(qdocexec), "qdoc executable path doesn't exist"
    return qtdocspath, qdocexec


def qdoc(qtdocspath, qdocexec):
    print("Running qdoc ...")
    print()
    env = os.environ
    env["QT_INSTALL_DOCS"] = qtdocspath
    result = subprocess.call([qdocexec, DEFAULT_QDOC_CONF], env=env)
    print()
    assert result == 0, "aborting"


def sanitize_html():
    print("Sanitize HTML code ...")
    with open("html/quey-ui-qmlmodule.html") as file:
        text = file.read()

    with open("html/quey-ui-qmlmodule.html", "w") as file:
        file.write(text.replace("<body>\n<li>Quey UI</li>", "<body>"))


def main():
    parser = argparse.ArgumentParser(description="Generate Quey UI documentation")
    parser.add_argument('--qtpath', type=str, default=DEFAULT_QT_PATH,
                        help="Qt installation path")
    parser.add_argument('--qtversion', type=str, default=DEFAULT_QT_VERSION,
                        help="Qt version")
    parser.add_argument('--qtdocspath', type=str, default=DEFAULT_QT_DOCS_PATH,
                        help="Qt docs installation path")
    parser.add_argument('--qdocexec', type=str, default=DEFAULT_QT_QDOC_PATH,
                        help="qdoc executable path")
    args = parser.parse_args()

    print("Run 'generate-docs.py -h' for usage instructions")

    qtdocspath, qdocexec = verify_installation(args)
    qdoc(qtdocspath, qdocexec)
    sanitize_html()

    print("Done")


if __name__ == '__main__':
    main()
