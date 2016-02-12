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
