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
