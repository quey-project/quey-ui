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
   \qmltype MenuItem
   \inqmlmodule quey.ui
   \inherits QtObject
   \brief Represents an item in a \l Menu
 */
QtObject {
    /*!
      The item text.
    */
    property string text

    /*!
      The icon name. This will pick the icon with the given name from the current theme.
    */
    property string iconName

    /*!
      A list of sub actions.
    */
    property list<Action> actions

    /*!
      Set to \c false to disable the menu item.
    */
    property bool enabled: true

    /*!
      Emitted when the item was triggered.
    */
    signal triggered()
}
