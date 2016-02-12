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
   \qmltype MessageBox
   \inherits Dialog
   \inqmlmodule quey.ui
   \brief Provides a messagebox with a row of buttons.

    \qml
    import QtQuick 2.4
    import quey.ui 0.1

    ApplicationView {
        width: 640
        height: 480

        Button {
            text: "Quit"
            anchors.centerIn: parent
            onClicked: message.open()
        }

        MessageBox {
            id: message
            title: "Hey there"
            text: "Are you sure to quit?"
            buttons: [
                Button {
                    text: "yes"
                    onClicked: Qt.quit()
                },
                Button {
                    text: "no"
                    onClicked: message.close()
                }
            ]
        }

    }
    \endqml
 */
Dialog {
    id: messageBox

    /*!
        A list of buttons. See \l Button.
    */
    property list<Button> buttons

    maximumWidth: Units.dp(640)
    minimumHeight: 0

    content: Column {
        width: childrenRect.width
        height: childrenRect.height

        spacing: Style.spacing

        WrapLabel {
            id: label
            availableWidth: messageBox.contentAvailableWidth
            text: messageBox.text
        }

        Row {
            width: Math.max(label.width, childrenRect.width)
            layoutDirection: Qt.RightToLeft

            Row {
                id: row
                spacing: Style.spacing
                width: childrenRect.width
                children:  messageBox.buttons
            }

        }
    }
}
