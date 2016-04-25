/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
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

