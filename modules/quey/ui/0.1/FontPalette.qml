/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
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
