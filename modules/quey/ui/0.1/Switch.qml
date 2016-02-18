/*
 * This file is part of the Quey Project
 * Copyright (C) 2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
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
import QtQuick.Controls 1.4 as Controls
import QtQuick.Controls.Styles 1.4
import quey.ui 0.1


Controls.Switch {
    property color color: Style.palette.regular

    style: SwitchStyle {
        groove: Rectangle {
            implicitHeight: Units.dp(24)
            implicitWidth: Units.dp(56)
            color: control.checked ? control.color : Style.palette.transparent
            radius: control.height*0.5
            border.width: Style.border.width
            border.color: control.color
            Behavior on color {
                ColorAnimation {
                    duration: 100
                }
            }
        }

        handle: Circle {
            id: handle
            color: control.checked ? Style.palette.white : control.color
            size: control.implicitHeight

            Behavior on color {
                ColorAnimation {
                    duration: 100
                }
            }
        }
    }
}
