/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import quey.ui 0.1
/*!
   \qmltype IconButton
   \inqmlmodule quey.ui
   \inherits Item
   \brief Provides a clickable icon

   \qml
    import QtQuick 2.4
    import quey.ui 0.1

    ApplicationView {
        IconButton {
            anchors.centerIn: parent
            iconName: "wand"
            onClicked: {
                console.log("Let's go!")
            }
        }
    }
   \endqml
 */
Item {
    id: iconButton

    /*!
        Emitted when the icon button was clicked.
    */
    signal clicked()

    /*!
        The color of the icon.
    */
    property color iconColor: Style.palette.regular

    /*!
        Sets the icon name. This will pick the icon with the given name from the installed icon set.
    */
    property alias iconName: icon.name

    /*!
        Sets the icon size.
    */
    property alias iconSize: icon.size

    /*!
        This property is \c true when the button contains the mouse.
    */
    readonly property bool hovered: mouseArea.containsMouse

    /*!
        If set to \c false the button ignores mouse hovering which results in \l hovered being \c false.
    */
    property alias hoverEnabled: mouseArea.hoverEnabled

    width: iconSize
    height: 48

    Icon {
        id: icon
        anchors.centerIn: parent
        color: enabled ? (!hovered ? iconColor : Style.hoverColor(iconColor)) : Style.disabledColor(iconColor)
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        hoverEnabled: true

        onClicked: iconButton.clicked()
    }
}
