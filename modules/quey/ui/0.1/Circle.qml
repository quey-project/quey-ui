/*
 * This file is part of the Quey Project
 *
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import quey.ui 0.1

/*!
   \qmltype Circle
   \inqmlmodule quey.ui
   \inherits Rectangle
   \brief A circle component.
 */
Rectangle {
    id: circle
    color: Style.palette.regular
    /*!
       \qmlproperty real size
       Set the size of the circle. The size is equal to the diameter, width and height of the circle.
     */
    property alias size: circle.width
    width: Units.dp(24)
    height: width
    radius: width * 0.5
}
