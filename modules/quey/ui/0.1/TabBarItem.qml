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

Item {
    id: tabBarItem

    height: Units.dp(67)
    width: Units.dp(256)

    property bool movable: view.movable

    property int uid: (index >= 0) ? model.uid : -1
    property var view: model.view

    property var tabView
    property var listView

    state: model.state

    states: [
        State {
            name: "active";
            PropertyChanges {
                target: tab
            }
        },

        State {
            name: "inactive"
            PropertyChanges {
                target: tab
            }
        },

        State {
            name: "dragging"; when: mouseArea.draggingId === tabBarItem.uid && movable
            PropertyChanges {
                target: tab
                x: mouseArea.mouseX-tabBarItem.width/2;
                z: 10;
                parent: listView
                y: tabBarItem.y
            }
        }
    ]

    Tab {
        id: tab

        iconName: view.iconName
        title: view.title
        closable: view.closable

        height: tabBarItem.height
        width: tabBarItem.width

        active: tabBarItem.state !== "inactive"

        onClosed: {
            tabView.removeTab(tabBarItem.uid);
        }
    }
}
