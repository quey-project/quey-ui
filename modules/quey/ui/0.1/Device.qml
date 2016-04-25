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

pragma Singleton

/*!
   \qmltype Device
   \inqmlmodule quey.ui

   \brief A singleton that provides information about the current device.

   \qml
   import QtQuick 2.4
   import quey.ui 0.1

   ApplicationView {
       width: Units.dp(640)
       height: Units.dp(480)

       Label {
           anchors.centerIn: parent
           text: "You're running a %1".arg(Device.name)+", how cool!"
       }

   }
   \endqml

 */
QtObject {
    id: device

    /*!
      The device type, enum-like.
    */
    property int type: desktop

    readonly property int phone: 0
    readonly property int phablet: 1
    readonly property int tablet: 2
    readonly property int desktop: 3
    readonly property int tv: 4
    readonly property int unknown: 5 //it's either bigger than tv or smaller than phone

    /*!
      The device name as string. Possible values are \c "phone", \c "phablet", \c "tablet", \c "computer", \c "TV", \c "device".
      \c "device" is returned if the \l type is \l unknown.
    */
    readonly property string name: {
        switch (type) {
            case 0:
                return "phone";
            case 1:
                return "phablet";
            case 2:
                return "tablet";
            case 3:
                return "computer";
            case 4:
                return "TV";
            case 5:
                return "device";
        }
    }

    /*!
      This property is \c true if the device is mobile.
    */
    readonly property bool isMobile: type == phone || type == phablet || type == tablet
}
