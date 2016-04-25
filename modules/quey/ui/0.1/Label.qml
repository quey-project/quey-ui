/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
