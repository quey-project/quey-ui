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
