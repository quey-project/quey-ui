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
