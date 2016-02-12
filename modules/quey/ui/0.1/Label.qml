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
   \qmltype Label
   \inqmlmodule quey.ui
   \inherits Text
   \brief Provides a text label with metrics and Quey styling.

   \qml
    import QtQuick 2.4
    import quey.ui 0.1

    ApplicationView {
        Column {
            anchors.fill: parent
            anchors.margins: Style.spacing
            spacing: Style.spacing

            Label {
                font: Style.font.heading
                text: "This is big"
                color: Style.palette.red
            }

            Label {
                font: Style.font.subheading
                text: "This is stylish"
                color: Style.palette.success
            }

            Label {
                text: "This is amazing"
                color: Style.palette.primary
            }
        }
    }
   \endqml

   Based on \c QtQuick.Text. Please refer to the \l {http://doc.qt.io/qt-5/qml-qtquick-text.html}{Qt documentation} for more information.
 */
Text {
    id: label
    font: Style.font.regular
    color: Style.palette.regular

    /*!
     This property provides metrics based on font and text.
     Please refer to the \l {http://doc.qt.io/qt-5/qml-qtquick-textmetrics.html}{Qt documentation} for more information.
    */
    property TextMetrics metrics: TextMetrics {
        font: label.font
        text: label.text
    }
}
