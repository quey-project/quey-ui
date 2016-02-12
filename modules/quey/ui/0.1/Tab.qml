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
