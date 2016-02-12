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
    width: 480
    height: 640

    PageRowLayout {
        id: pageView
        anchors.fill: parent

        containers: [
            PageColumn {
                id: pcLeft
                when: pageView.width > Units.dp(350)
                pageView: pageView
                hidden: isEmpty
                Layout.minimumWidth: Units.dp(150)
                Layout.maximumWidth: Units.dp(200)
            },

            PageColumn {
                id: pcMain
                when: true
                pageView: pageView
                Layout.minimumWidth: Units.dp(200)
                Layout.fillWidth: true
            },

            PageColumn {
                id: pcRight
                pageView: pageView
                when: pageView.width > Units.dp(500)
                hidden: isEmpty
                Layout.fillWidth: true
                Layout.minimumWidth: Units.dp(200)
                Layout.maximumWidth: Units.dp(250)
            },

            PageDialog {
                id: pageDialog
                maximumWidth: Units.dp(640)
                maximumHeight: Units.dp(480)
                pageView: pageView
                when: pageView.width > Units.dp(500)
            },

            PageWindow {
                id: pageWindow
                width: Units.dp(640)
                height: Units.dp(480)
                pageView: pageView
                when: pageView.width > Units.dp(640)
            }
        ]

        Page {
            id: myLeftSideBar
            title: "Left"
            containers: [
                pcLeft,
                pcMain
            ]

            Column {
                anchors.fill: parent

                anchors.margins: Style.spacing

                spacing: Style.spacing

                Label {
                    text: "Left Sidebar"
                }

                Button {
                    text: "Add SubPage"
                    onClicked: {
                        pageView.push(myLeftSubPage);
                    }
                }
            }
        }

        Page {
            id: myMainPage
            title: "Main"
            containers: [pcMain]

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
                    enabled: false
                },
                Action {
                    text: "Login"
                    iconName: "log-in"
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
                    text: "Add left Sidebar"
                    onClicked: {
                        pageView.push(myLeftSideBar);
                    }
                }

                Button {
                    text: "Add right Sidebar"
                    onClicked: {
                        pageView.push(myRightSideBar);
                    }
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
            id: myRightSideBar
            menu: Menu {
                parent: myRightSideBar
                items: [
                    MenuItem {
                        text: "File"
                        iconName: "open"
                        actions: [
                            Action {
                                text: "New"
                                enabled: false
                            },
                            Action {
                                text: "Open"
                                onTriggered: console.log("open triggered")
                            }
                        ]
                    },
                    MenuItem {
                        text: "Edit"
                        iconName: "edit"
                        enabled: false
                        onTriggered: console.log("Edit triggered")
                    },
                    MenuItem {
                        text: "Overflooooooooooooooooooooooooow"
                        actions: [
                            Action {

                            }
                        ]
                    },
                    MenuItem {
                        text: "Quit"
                    }

                ]
            }
            title: "Right"
            containers: [pcRight, pcMain]

            Column {
                anchors.fill: parent

                anchors.margins: Style.spacing

                spacing: Style.spacing

                Label {
                    text: "Rigth Sidebar"
                }

                TextField {

                }

                CheckBox {
                    text: "Something"
                }
            }
        }

        Page {
            id: myLeftSubPage
            title: "leftSub"
            containers: [
                pcLeft,
                pcMain
            ]
        }

        Page {
            id: settingsPage
            title: "Settings"
            containers: [
                pageWindow,
                pageDialog,
                pcMain
            ]

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
