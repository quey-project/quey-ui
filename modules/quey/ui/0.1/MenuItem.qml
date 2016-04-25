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
