/*
 * Part of this code is based on QML-Material (https://github.com/papyros/qml-material/)
 * Quey Modificatons
 * Copyright (C) 2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com> *
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
