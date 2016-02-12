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
import QtQuick.Layouts 1.1
import quey.ui 0.1
/*!
   \qmltype MenuListItem
   \inqmlmodule quey.ui
   \inherits ListItem
   \brief Represents a menu item in a \l Menu visually.
 */
ListItem {
    id: listItem

    /*!
        The icon name. This will pick the icon with the given name from the current theme.
    */
    property string iconName

    /*!
        The text of the item.
    */
    property string text

    /*!
        Sets whether the item has a sub menu attached.
    */
    property bool hasSubMenu: false

    /*!
        The text color.
    */
    property color textColor: Style.palette.regular

    /*!
        The background color.
    */
    property color backgroundColor: Style.palette.background

    Rectangle {
        anchors.fill: parent
        color: backgroundColor
    }

    RowLayout {
        anchors {
            fill: parent
            rightMargin: Style.spacing
            leftMargin: Style.spacing
        }
        spacing: Style.spacing

        Icon {
            name: listItem.iconName
            opacity: name ? 1 : 0
            color: enabled ? textColor : Style.disabledColor(textColor)
        }

        ElideLabel {
            elideWidth: width
            anchors.verticalCenter: parent.verticalCenter
            Layout.fillWidth: true
            text: listItem.text
            color: enabled ? textColor : Style.disabledColor(textColor)
        }

        IconButton {
            visible: listItem.hasSubMenu
            anchors.verticalCenter: parent.verticalCenter
            iconName: "arrow-right"
            iconColor: enabled ? textColor : Style.disabledColor(textColor)
        }
    }
}
