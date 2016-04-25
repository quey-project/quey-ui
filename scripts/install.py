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

import subprocess
import os
import os.path


def distclean():
    subprocess.call(['make', 'distclean'])


def install_system_wide(qmake_path):
    # Run qmake
    subprocess.call([qmake_path])
    # Run make
    subprocess.call(['make'])
    # Run make install
    subprocess.call(['make', 'install'])


def install_per_project(project_path):
    cwd = os.path.dirname(os.path.realpath(__file__))
    os.chdir(project_path)
    subprocess.call(['git', 'submodule', 'add',
                     'https://github.com/quey-project/quey-ui',
                     'quey-ui'])
    os.chdir(cwd)
    print("Make sure to add 'include(quey-ui/quey-ui.pri)' to your .pro file.")
