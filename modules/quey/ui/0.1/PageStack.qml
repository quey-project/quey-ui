/*
 * This file is part of the Quey Project
 * Copyright (C) 2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import quey.ui 0.1
/*!
   \qmltype PageStack
   \inqmlmodule quey.ui
   \inherits PageView
   \brief A classic \l PageView displaying a single page at a time.

   \qml
    import QtQuick 2.4
    import quey.ui 0.1


    ApplicationView {
        width: 480
        height: 640

        PageStack {
            id: pageView
            anchors.fill: parent

            Page {
                id: mainPage
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

                Button {
                    anchors.centerIn: parent
                    text: "Settings"
                    onClicked: {
                        pageView.push(settingsPage);
                    }
                }
            }

            Page {
                id: settingsPage
                title: "Settings"

                CheckBox { anchors.centerIn: parent; text: "Settings" }
            }

            Component.onCompleted: {
                pageView.push(mainPage);
            }
        }
    }
   \endqml
*/
PageView {
    id: pageStack

    PageColumn {
        id: container
        anchors.fill: parent
        when: true
        pages: pageStack.pages
    }
}
