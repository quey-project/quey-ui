/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
/*!
   \qmltype ColorPalette
   \inqmlmodule quey.ui
   \inherits Item
   \brief Defines the fonts

   \l FontPalette holds set of fonts. It should be used within a \l Theme to define its font set:
   \qml
    import QtQuick 2.4
    import quey.ui 0.1

    Theme {
        FontLoader {
            id: myFont
            source: "myfont.ttf"
        }

        font: FontPalette {
            regular: Qt.font({
                family: myFont.name,
                pixelSize: 16
            })
        }
    }
   \endqml
    It is recommended to use \l {http://doc.qt.io/qt-5/qml-qtquick-fontloader.html}{FontLoader} to load custom fonts.

 */
Item {
    /*!
        The regular font.
    */
    property font regular
    /*!
        The font for subheadings.
    */
    property font subheading
    /*!
        The font for headings.
    */
    property font heading
    /*!
        The font to be used in case of source codes.
    */
    property font code
}
