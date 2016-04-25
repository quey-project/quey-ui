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
   \qmltype MenuButton
   \inqmlmodule quey.ui
   \inherits IconButton
   \brief An \l IconButton that displays an attached \l menu on click.
 */
IconButton {
    id: menuButton
    objectName: "MenuButton"
    iconName: "menu"

    /*!
        The \l Menu to be shown.
    */
    property Menu menu

    /*!
        The top margin of the \l menu.
    */
    property int topMargin

    onClicked: {
        if (menu.parent === null)
            menu.parent = menuButton;
        menu.x = menuButton.mapToItem(null, 0, 0).x + Units.dp(4)
        menu.y = menuButton.mapToItem(null, 0, 0).y + topMargin
        menu.open();
    }
}
