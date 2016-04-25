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
   \qmltype PageHeadView
   \inqmlmodule quey.ui
   \inherits ActionBar
   \brief Provides an \l ActionBar with a bottom-anchored \l Separator.

   This is used internally.
*/
ActionBar {
    id: pageHeadView

    Separator {
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
}
