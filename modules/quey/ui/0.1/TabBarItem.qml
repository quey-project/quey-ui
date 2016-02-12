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

Item {
    id: tabBarItem

    height: Units.dp(67)
    width: Units.dp(256)

    property bool movable: model.movable

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

        iconName: model.iconName
        title: model.title
        closable: model.closable

        height: tabBarItem.height
        width: tabBarItem.width

        active: tabBarItem.state !== "inactive"

        onClosed: {
            tabView.removeTab(tabBarItem.uid);
        }
    }
}
