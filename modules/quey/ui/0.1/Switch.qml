/*
 * This file is part of the Quey Project
 * Copyright (C) 2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
