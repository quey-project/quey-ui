# Quey UI

A set of truly cute QML components

## Third-party software
Quey UI contains the following third-party software and resources:
* The [Ionicons icon set](https://github.com/driftyco/ionicons) released under the [MIT license](http://opensource.org/licenses/MIT)
* The [Encode Sans font by Pablo Impallari & Andres Torresi](http://www.impallari.com/testing/encode/) released under the [SIL Open Font License](https://opensource.org/licenses/OFL-1.1)
* The [Hack font](https://github.com/chrissimpkins/Hack) released under the [Hack Open Font License](https://github.com/chrissimpkins/Hack/blob/master/LICENSE.md)

Part of this code is based on [QML-Material](https://github.com/papyros/qml-material) as highlighted in the license headers of the individual files.
The demo code is released under the [MIT license](https://opensource.org/licenses/MIT).

# Installation

## Dependencies
* Qt 5.4 or higher
* QtQuick, QtQuick.Controls

If you want to use the included scripts you also need to have Python 3 installed.

## Installation on Linux

### Per-project installation

Clone Quey UI and use the setup script to install a git submodule to your project:

```
    git clone https://github.com/quey-project/quey-ui
    cd quey-ui
    ./setup.py submodule -project <path-to-project>
```

Or alternatively, if you don't want to use the setup script:

```
    cd <path-to-project>
    git submodule add https://github.com/quey-project/quey-ui quey-ui
```

Generate the `qrc` wrapper files:
```
    cd <path-to-project/quey-ui>
    ./setup.py qrc
```

Add the `.pri` file to your Qt project file (`.pro`):

```
    include(quey-ui/quey-ui.pri)
```

### System-wide installation

```
    git clone https://github.com/quey-project/quey-ui
    cd quey-ui
    ./setup.py install -qmake <path-to-qmake>
```

Or alternatively, if you don't want to use the setup script:

```
    git clone https://github.com/quey-project/quey-ui
    cd quey-ui
    qmake
    make
    make install
```

## Copyright and License
(C) Copyright 2015-2016 by Tim Süberkrüb

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.

See LICENSE for more information.
