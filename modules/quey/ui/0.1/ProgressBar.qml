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
import QtQuick.Controls 1.3 as Controls
import QtQuick.Controls.Styles 1.3
import quey.ui 0.1

Controls.ProgressBar {
    id: progressBar

    property color color: Style.palette.regular

    style: ProgressBarStyle {
        background: Rectangle {
            color: Style.palette.widgetBackground
            border.color: Style.palette.regular
            border.width: Style.border.width
            radius: Style.border.radius
            implicitWidth: Units.dp(200)
            implicitHeight: Units.dp(24)
        }

        progress: Rectangle {
            color: control.color
            border.color: control.color
            radius: Style.border.radius

            Item {
                anchors.fill: parent
                anchors.margins: Style.border.width
                visible: control.indeterminate
                clip: true
                Row {
                    Repeater {
                        Rectangle {
                            color: index % 2 ?  control.color : Style.alpha(Style.palette.white, 0.2)
                            width: 20 ; height: control.height
                        }
                        model: control.width / 20 + 2
                    }
                    XAnimator on x {
                        from: -40 ; to: 0
                        loops: Animation.Infinite
                        running: control.indeterminate
                    }
                }
            }
        }
    }
}

