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
import quey.ui 0.1
/*!
   \qmltype RadioButton
   \inqmlmodule quey.ui
   \inherits Item
   \brief Provides a radio button.
*/
Item {
    objectName: "RadioButton"
    id: item

    width: row.width
    height: row.height

    /*!
        The color of the button. Defaults to \c Style.palette.regular.
    */
    property color color: Style.palette.regular

    /*!
        Emitted if the button is clicked.
    */
    signal clicked ()

    /*!
        The text to be displayed next to the button.
    */
    property string text

    /*!
        This property is \c true if this button is selected.
    */
    property bool selected: false

    /*!
        This property is \c true if the button is currently pressed.
    */
    property alias pressed: mouseArea.pressed


    /*!
        This property is \c true if the button contains the mouse.
    */
    property alias hovered: mouseArea.containsMouse

    /*!
        The \l RadioGroup. Defaults to \c parent.
    */
    property Item group: parent

    /*!
        Whether the group is valid or not.
    */
    readonly property bool isGroupValid: group.objectName === "RadioGroup"

    Row {
        id: row
        spacing: Style.padding

        Circle {
            anchors.verticalCenter: parent.verticalCenter

            width: Units.dp(24)
            border.width: Style.border.width
            border.color: enabled ? item.color : Style.disabledColor(item.color)

            color: selected ? (enabled ? item.color : (hovered ? Style.hoverColor(item.color) : Style.disabledColor(item.color) )) : Style.palette.widgetBackground

            property alias text: label.text

            Behavior on color {
                ColorAnimation {
                    duration: Style.colorTransitionDuration
                }

            }
        }

        Label {
            id: label
            anchors.verticalCenter: parent.verticalCenter

            color: enabled ? item.color : Style.disabledColor(item.color)
            text: item.text
        }

    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            item.clicked();
            if (!selected)
                selected = true;
        }
    }

    onSelectedChanged: {
        if (selected) {
            if (isGroupValid)
                group.itemSelected(item);
        }
    }

    Component.onCompleted: {
        if (selected)
            group.itemSelected(item);
    }
}
