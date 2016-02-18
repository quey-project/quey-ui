/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import QtQuick 2.4
import QtQuick.Layouts 1.1
import quey.ui 0.1


ApplicationView {
    width: 640
    height: 480

    Flickable {
        anchors.fill: parent
        anchors.margins: Style.spacing
        clip: true
        contentHeight: column.childrenRect.height

        Column {
            id: column
            anchors.centerIn: parent
            spacing: Style.spacing

            Row {
                spacing: Style.spacing

                IconButton {
                    iconName: "close-round"
                }

                Label {
                    text: "Icon Button"
                }
            }

            Button {
                text: "Default Dialog"
                onClicked: dialogDefault.open()
            }

            Button {
                text: "MessageBox"
                onClicked: msgBox.open()
            }

            Button {
                text: "Custom Dialog"
                onClicked: dialogCustom.open()
            }

            Row {
                spacing: Style.spacing

                Switch {}

                Label {
                    text: "Switch"
                }
            }

            Slider {
                maximumValue: 100
                minimumValue: 0
                orientation: Qt.Horizontal
                stepSize: 5
                tickmarksEnabled: true
            }

            Slider {
                maximumValue: 100
                minimumValue: 0
                orientation: Qt.Vertical
                stepSize: 5
            }

            Label {
                text: "Style.font.heading"
                font: Style.font.heading
            }

            Label {
                text: "Style.font.subheading"
                font: Style.font.subheading
            }

            Label {
                text: "Style.font.standard"
                font: Style.font.regular
            }

            ActivityIndicator {
                running: true
            }

            ProgressBar {
                minimumValue: 0
                maximumValue: 100
                value: 50
            }

            ProgressBar {
                indeterminate: true
            }

            CheckBox {
                text: "Check me"
            }

            ListView {
                model: 50
                width: parent.width
                height: Units.dp(256)
                delegate: ListItem {
                    width: parent.width
                    height: Units.dp(48)

                    Label {
                        text: index
                        anchors.centerIn: parent
                    }

                }

            }

            CheckBox {
                text: "Disabled"
                enabled: false
            }

            TextField {
                placeholderText: "Enter text ..."
            }

            TextField {
                enabled: false
                placeholderText: "Disabled"
            }

            TextArea {

            }

            Button {
                text: "Success"
                color: Style.palette.success
            }

            Button {
                text: "Standard"
                color: Style.palette.regular
            }

            Button {
                text: "Primary"
                color: Style.palette.primary
            }

            Button {
                text: "Warning"
                color: Style.palette.warning
            }

            Button {
                text: "Danger"
                color: Style.palette.danger
            }

            Button {
                text: "Disabled"
                enabled: false
            }

            RadioGroup {
                id: radioGroup

                RadioButton {
                    text: "1"
                    selected: true
                    color: Style.palette.primary
                }

                RadioButton {
                    text: "2"
                    color: Style.palette.success
                }

                Repeater {
                    model: 5

                    RadioButton {
                        text: 3+index
                    }
                }

                RadioButton {
                    text: "Something"
                }

                RadioButton {
                    text: "disabled"
                    enabled: false
                }
            }
        }
    }


    MessageBox {
        id: msgBox
        title: "Warning"
        text: "Are you sure to do this operation? This may cause data loss. Contact our support if you have any questions."
        buttons: [
            Button {
                text: "yes"
            },
            Button {
                text: "no"
            }
        ]
    }

    Dialog {
        id: dialogCustom
        title: "Dialog with custom content"

        minimumHeight: 0

        content: Column {
            width: childrenRect.width
            height: childrenRect.height

            spacing: Style.spacing

            WrapLabel {
                id: label
                availableWidth: dialogCustom.contentAvailableWidth
                text: "Are you sure to do this operation? This may cause data loss. Contact our support if you have any questions."
            }

            ActivityIndicator {
                running: chbxActivityRunning.checked
            }

            CheckBox {
                id: chbxActivityRunning
                text: "running"
            }

            Row {
                spacing: Style.spacing
                width: Math.max(childrenRect.width, label.width)
                layoutDirection: Qt.RightToLeft

                Button {
                    text: "no"
                }

                Button {
                    text: "yes"
                }
            }
        }
    }

    Dialog {
        id: dialogDefault
        maximumWidth: Units.dp(640)
        maximumHeight: Units.dp(480)
        title: "My Dialog"
        text: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."
    }
}
