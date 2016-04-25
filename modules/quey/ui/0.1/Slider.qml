/*
 * Part of this code is based on QML-Material (https://github.com/papyros/qml-material/)
 * Quey Modificatons
 * Copyright (C) 2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com> *
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import QtQuick.Controls 1.3 as Controls
import QtQuick.Controls.Styles 1.3
import quey.ui 0.1


Controls.Slider {
    property color color: Style.palette.regular

    style: SliderStyle {
        handle: Item{
            implicitWidth:  Units.dp(24)
            implicitHeight: Units.dp(24)

            Rectangle {
                id: handle
                anchors.fill: parent

                radius: width * 0.5

                border.color: control.color
                border.width: Style.border.width
                color: Style.palette.white
            }
        }

        groove: Rectangle {
            implicitWidth: 200
            implicitHeight: Units.dp(8)
            color: Style.palette.regular
            radius: Style.border.radius
        }

        tickmarks: Repeater {
            id: repeater
            model: control.stepSize > 0 ? 1 + (control.maximumValue - control.minimumValue) / control.stepSize : 0

            Rectangle {
                color: Style.palette.regular
                width: Math.round(Units.dp(1))
                height: Units.dp(9)
                y: repeater.height / 2
                x: styleData.handleWidth / 2 + index * ((repeater.width - styleData.handleWidth) / (repeater.count-1))
            }
        }

    }
}
