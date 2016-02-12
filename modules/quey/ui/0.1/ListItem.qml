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
   \qmltype ListItem
   \inqmlmodule quey.ui
   \inherits Rectangle
   \brief A list item with separator lines.
 */
Rectangle {
    id: listItem
    implicitHeight: Units.dp(48)

    color: Style.palette.background

    /*!
      If set to \c true the bottom separator is visible. Defaults to true.
    */
    property bool showBottomSeparator: true

    /*!
      If set to \c true the top separator is visible. If used within a model this defaults to \c false unless it is the first element.
    */
    property bool showTopSeparator: typeof index != "undefined" ? (index === 0) : false


    /*!
      Emitted when the item is clicked.
    */
    signal clicked ()

    Separator {
        visible: showBottomSeparator
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }

    Separator {
        visible: showTopSeparator
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: listItem.clicked()
    }
}
