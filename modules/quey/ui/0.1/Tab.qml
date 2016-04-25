/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import QtQuick.Layouts 1.0
import quey.ui 0.1

Item {
    id: tab
    objectName: "Tab"

    property int tabHeight

    property string title
    property string iconName

    property bool closable: false
    property bool active

    signal closed ()

    function close() {
        closeAnimation.start();
    }

    NumberAnimation {
        id: closeAnimation
        target: tabShape
        property: "y"
        from: tabShape.y
        to: tabShape.y + tabShape.height
        duration: 100
        easing.type: Easing.InOutQuad
        onStopped: {
            closed();
        }
    }

    QueyShape {
        id: tabShape
        y: Style.padding + Units.dp(radius*2)
        width: parent.width
        height: Units.dp(48) + Units.dp(radius*2)
        border.width: 0
        color: active ? "white" : Style.palette.regular

        RowLayout {
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                leftMargin: Style.padding
                rightMargin: Style.padding
            }

            height: Units.dp(48)

            spacing: Style.spacing

            Icon {
                name: tab.iconName
                color: active ? Style.palette.regular : "white"
                visible: name !== ""
            }

            ElideLabel {
                text: tab.title
                color: active ? Style.palette.regular : "white"
                Layout.fillWidth: true
            }

            IconButton {
                visible: closable
                iconName: "close-round"
                iconColor: active ? Style.palette.regular : "white"
                iconSize: Units.dp(16)
                onClicked: close()
            }

        }

    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
        onClicked: {
            if (mouse.button === Qt.MiddleButton && closable)
                close();
            else
                mouse.accepted = false;
        }
    }

}
