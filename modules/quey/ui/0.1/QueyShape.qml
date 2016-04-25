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
   \qmltype QueyShape
   \inqmlmodule quey.ui
   \inherits Rectangle
   \brief Provides a rounded rectangle.
*/
Rectangle {
    color: Style.palette.widgetBackground
    radius: Style.border.radius
    border.width: Style.border.width
    border.color: Style.palette.regular
}
