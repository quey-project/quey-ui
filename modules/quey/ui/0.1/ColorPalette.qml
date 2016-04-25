/*
 * This file is part of the Quey Project
 *
 * Copyright (C) 2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
/*!
   \qmltype ColorPalette
   \inqmlmodule quey.ui
   \inherits QtObject
   \brief Defines a color palette

   To be used within a \l Theme component:
   \qml
   Theme {
       palette: ColorPalette {
           green: "green"
           blue: Qt.rgba(0, 0, 255, 1)
           regular: "black"
           warning: "red"
       }
   }
   \endqml

   Basic colors:
   \list
   \li \l green
   \li \l blue
   \li \l red
   \li \l orange
   \li \l yellow
   \li \l purple
   \li \l darkGrey
   \li \l mediumGrey
   \li \l lightGrey
   \li \l white
   \li \l transparent
   \endlist

   Context types:
   \list
   \li \l regular
   \li \l primary
   \li \l success
   \li \l warning
   \li \l danger
   \li \l separator
   \li \l background
   \li \l widgetBackground
   \endlist

 */
QtObject {
    // Base colors
    property color green
    property color blue
    property color red
    property color orange
    property color yellow
    property color purple
    property color darkGrey
    property color mediumGrey
    property color lightGrey
    property color white
    property color transparent

    // Color classes

    /*!
        The regular color to be used in labels as well as for widgets.
    */
    property color regular

    /*!
        The app background color.
    */
    property color background

    /*!
        The color to be used as widget background.
    */
    property color widgetBackground

    /*!
        The primary color to highlight specific elements.
    */
    property color primary

    /*!
        A color highlighting success.
    */
    property color success

    /*!
        A warning color.
    */
    property color warning

    /*!
        A color highlighting danger.
    */
    property color danger

    /*!
        Color for separators, e.g. \l Separator.
    */
    property color separator
}
