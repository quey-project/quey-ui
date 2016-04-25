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
