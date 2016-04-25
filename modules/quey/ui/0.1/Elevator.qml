/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.0
import QtGraphicalEffects 1.0
import quey.ui 0.1
/*!
   \qmltype Elevator
   \inqmlmodule quey.ui
   \inherits Item
   \brief Applies a \c DropShadow to a \l source item to create an illusion of elevation.
 */
Item {
    width: container.height
    height: container.width

    /*!
        This property holds the source the shadow should be applied to.
        \note You should set the \c visible property of \l source to \c false.
     */
    property Item source

    /*!
      The shadow's offset (both vertical and horizontal).
     */
    property real offset: Units.dp(3)

    Item {
        id: container
        anchors.centerIn: parent
        width:  source.width  + (2 * shadow.radius)
        height: source.height + (2 * shadow.radius)

        children: [
            source
        ]
    }

    DropShadow {
        id: shadow
        anchors.fill: source
        cached: true
        horizontalOffset: offset
        verticalOffset: offset
        radius: 8.0
        samples: 16;
        color: "#80000000"
        smooth: true
        source: container
    }
}
