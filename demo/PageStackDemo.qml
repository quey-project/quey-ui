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
import quey.ui 0.1


ApplicationView {
    width: 480
    height: 640

    PageStack {
        id: pageView
        anchors.fill: parent

        Page {
            id: myMainPage
            title: "Main"

            menuItems: [
                MenuItem {
                    text: "New file"
                }
            ]

            actions: [
                Action {
                    text: "New file"
                    iconName: "plus"
                    tooltip: text
                },
                Action {
                    text: "Login"
                    tooltip: text
                }
            ]

            Column {
                anchors.fill: parent

                anchors.margins: Style.spacing

                spacing: Style.spacing

                Label {
                    text: "Main Page"
                }

                Button {
                    text: "Settings"
                    onClicked: {
                        pageView.push(settingsPage);
                    }
                }
            }
        }

        Page {
            id: settingsPage
            title: "Settings"

            Column {
                anchors.fill: parent

                anchors.margins: Style.spacing

                spacing: Style.spacing

                ActivityIndicator {
                    running: true
                }

                TextField {

                }

                CheckBox {
                    text: "Something"
                }
            }
        }

        Component.onCompleted: {
            pageView.push(myMainPage);
        }
    }
}
