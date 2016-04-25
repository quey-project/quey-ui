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

import os
import os.path
import collections
import xml.etree.ElementTree as etree
import xml.dom.minidom as minidom
from collections import namedtuple

default_allowed_extensions = [
    ".js", ".qml", ".otf", ".ttf", ".png", ".jpg", ".svg",
    ".jpeg", ".svg", "qmldir"
]

ResourceDir = namedtuple("ResourceDir", ["path", "prefix", "recurse"])
ResourceDir.__new__.__defaults__ = (".", "/", True)


def create_qrc(*dirs, filename="out.qrc", allowed_extensions=default_allowed_extensions):
    root_element = etree.Element('RCC')
    pwd = os.path.dirname(filename)
    prefixed_files = {}
    for dir in dirs:
        recurse = False
        if type(dir) == str:
            prefix = "/"
            dirname = dir
        elif isinstance(dir, ResourceDir):
            prefix = dir.prefix
            dirname = dir.path
            recurse = dir.recurse
        elif isinstance(dir, collections.Iterable):
            prefix = dir[1]
            dirname = dir[0]
        file_list = []
        if recurse:
            for root, dirs, files in os.walk(dirname):
                file_list += [os.path.relpath(os.path.join(root, filename), pwd)
                              for filename in files]
        else:
            file_list = [os.path.relpath(os.path.join(dirname, f), pwd) for f in os.listdir(dirname)]
        if not prefix in prefixed_files:
            prefixed_files[prefix] = []
        prefixed_files[prefix].extend(file_list)
    for prefix in sorted(prefixed_files.keys()):
        file_list = prefixed_files[prefix]
        prefix_element = etree.SubElement(root_element, "qresource", prefix=prefix)
        for file in file_list:
            if len(list(filter(lambda ext: file.endswith(ext), allowed_extensions))) > 0:
                etree.SubElement(prefix_element, "file", {}).text = file
    roughxml = etree.tostring(root_element)
    prettyxml = minidom.parseString(roughxml).toprettyxml()
    with open(filename, "w") as file:
        file.write(prettyxml)


def create_qml_qrc():
    create_qrc(
        ResourceDir(
            path="modules/quey/ui/",
            prefix="quey/ui",
            recurse=False
        ),
        ResourceDir(
            path="modules/quey/ui/0.1",
            prefix="quey/ui/0.1"
        ),
        filename="ui.qrc"
    )


def create_fonts_qrc():
    create_qrc(
        ResourceDir(
            path="modules/quey/ui/fonts",
            prefix="quey/ui/fonts",
        ),
        filename="fonts.qrc"
    )


def create_icons_qrc():
    create_qrc(
        ResourceDir(
            path="modules/quey/ui/icons",
            prefix="quey/ui/icons",
        ),
        filename="icons.qrc"
    )


def create_default_qrc():
    create_qml_qrc()
    create_fonts_qrc()
    create_icons_qrc()


def create_fat_qrc():
    create_qrc(
        ResourceDir(
            path="modules/quey/ui/",
            prefix="quey/ui",
            recurse=False
        ),
        ResourceDir(
            path="modules/quey/ui/0.1",
            prefix="quey/ui/0.1"
        ),
        ResourceDir(
            path="modules/quey/ui/fonts",
            prefix="quey/ui/fonts",
        ),
        ResourceDir(
            path="modules/quey/ui/icons",
            prefix="quey/ui/icons",
        ),
        filename="quey-ui.qrc"
    )
