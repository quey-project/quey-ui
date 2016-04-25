/*
 * Part of this code is based on QML-Material (https://github.com/papyros/qml-material/)
 * Quey Modificatons
 * Copyright (C) 2015 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2014-2015 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4

pragma Singleton

/*!
   \qmltype Units
   \inqmlmodule quey.ui

   \brief Provides access to screen-independent Units known as DPs (device-independent pixels).

   This singleton provides methods for building a user interface that automatically scales based on
   the screen density. Use the \l Units::dp function wherever you need to specify a screen size,
   and your app will automatically scale to any screen density.

   Here is a short example:

   \qml
   import QtQuick 2.4
   import quey.ui 0.1

   Rectangle {
       width: Units.dp(100)
       height: Units.dp(80)

       Label {
           text:"A"
           font.pixelSize: Units.dp(50)
       }
   }
   \endqml
*/
QtObject {
    id: units

    /*!
       \internal
       This holds the pixel density used for converting millimeters into pixels. This is the exact
       value from \l Screen:pixelDensity, but that property only works from within a \l Window type,
       so this is hardcoded here and we update it from within \l ApplicationWindow
     */
    property real pixelDensity: 4.46
    property real multiplier: 1.4 //default multiplier, but can be changed by user

    /*!
       This is the standard function to use for accessing device-independent pixels. You should use
       this anywhere you need to refer to distances on the screen.
     */
    function dp(number) {
        return Math.round(number*((pixelDensity*25.4)/160)*multiplier);
    }

    function gu(number) {
        return number * gridUnit
    }

    property int gridUnit: dp(64)
}
