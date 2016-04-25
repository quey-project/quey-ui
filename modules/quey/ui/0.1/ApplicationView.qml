/*
 * Part of this code is based on QML-Material (https://github.com/papyros/qml-material/)
 * Quey Modificatons
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2014-2015 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import QtQuick.Window 2.1
import quey.ui 0.1
/*!
   \qmltype ApplicationView
   \inqmlmodule quey.ui
   \inherits Rectangle
   \brief Provides the root item for applications

   It is recommended to use either \l ApplicationView or \l ApplicationWindow as root component for any Quey UI based application.

   \l ApplicationView provides layer components neccessary to display popups like \l Dialog or \l Menu.
   Those layers have a \c z  value of \c 25. Please keep the \c z values of your items under this value
   unless you want those items to be displayed above popups.

   \qml
   import QtQuick 2.4
   import quey.ui 0.1

   ApplicationView {
       width: Units.dp(640)
       height: Units.dp(480)

       Button {
           anchors.centerIn: parent
           text: "Hello World"
       }
   }
   \endqml

   Also see \l ApplicationWindow.

 */
Rectangle {
    id: application
    objectName: "ApplicationView"

    color: Style.palette.background
    visible: true

    OverlayLayer {
        z: 25
        id: overlayLayer
    }

    OverlayLayer {
        z: 25
        objectName: "dialogOverlayLayer"
    }

    OverlayLayer {
        z: 25
        objectName: "menuOverlayLayer"
    }

    // Fix window fills not whole screen on mobile
    width: Device.isMobile ? Screen.desktopAvailableWidth : Units.dp(800)
    height: Device.isMobile ? Screen.desktopAvailableHeight : Units.dp(600)

    Component.onCompleted: {
        // Set the root object for Alert
        Alert.root = application;

        Units.pixelDensity = Qt.binding(function() {
            return Screen.pixelDensity
        });

        Device.type = Qt.binding(function () {
            var diagonal = Math.sqrt(Math.pow((Screen.width/Screen.pixelDensity), 2) +
                    Math.pow((Screen.height/Screen.pixelDensity), 2)) * 0.039370;

            if (diagonal >= 3.5 && diagonal < 5) { //iPhone 1st generation to phablet
                Units.multiplier = 1;
                return Device.phone;
            } else if (diagonal >= 5 && diagonal < 6.5) {
                Units.multiplier = 1;
                return Device.phablet;
            } else if (diagonal >= 6.5 && diagonal < 10.1) {
                Units.multiplier = 1;
                return Device.tablet;
            } else if (diagonal >= 10.1 && diagonal < 29) {
                return Device.desktop;
            } else if (diagonal >= 29 && diagonal < 92) {
                return Device.tv;
            } else {
                return Device.unknown;
            }
        });

        // Nasty hack because singletons cannot import the module they were declared in, so
        // the grid unit cannot be defined in either Device or Units, because it requires both.
        Units.gridUnit = Qt.binding(function() {
            return Device.type === Device.phone || Device.type === Device.phablet
                    ? Units.dp(48) : Device.type == Device.tablet ? Units.dp(56) : Units.dp(64)
        })
    }

}
