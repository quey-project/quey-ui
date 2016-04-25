/*
 * This file is part of the Quey Project
 * Copyright (C) 2015 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import QtQuick.Controls 1.3 as Controls
import QtQuick.Controls.Styles 1.3
import quey.ui 0.1


Controls.TextField {
    id: textField

    implicitHeight: Units.dp(34)

    property color color: Style.palette.regular

    style: TextFieldStyle {

        font: Style.font.regular

        textColor: textField.enabled ? textField.color : Style.disabledColor(textField.color)

        background: QueyShape {
            height: textField.height
            width: textField.width

            border.color: textField.enabled ? textField.color : Style.disabledColor(textField.color)
            radius: Style.border.radius
        }
    }
}
