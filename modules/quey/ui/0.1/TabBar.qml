/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import QtQuick.Layouts 1.0
import quey.ui 0.1

Item {
    id: tabBar
    objectName: "TabBar"
    height: tabHeight + Style.padding + Units.dp(Style.border.radius*2)

    property alias listView: listView
    property alias tabsModel: listView.model
    property var tabView
    property Menu menu
    property list<Action> actions

    property int tabHeight: Units.dp(48)
    property color color: Style.palette.regular

    Rectangle {
        anchors.fill: parent
        color: tabBar.color
    }

    RowLayout {
        anchors {
            fill: parent
            leftMargin: menu !== null ? Style.padding : 0
        }

        spacing: Style.spacing

        MenuButton {
            visible: menu !== null
            menu: tabBar.menu
            iconColor: "white"
            topMargin: tabBar.height / 2
        }

        ListView {
            id: listView

            Layout.fillWidth: true
            Layout.fillHeight: true

            orientation: ListView.Horizontal
            boundsBehavior: Flickable.StopAtBounds
            spacing: Units.dp(4)
            interactive: mouseArea.draggingId == -1
            clip: true

            delegate: TabBarItem {
                tabView: tabBar.tabView
                listView: tabBar.listView
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                hoverEnabled: true
                property int index: listView.indexAt(mouseX + listView.contentX, mouseY)
                property int draggingId: -1
                property int activeIndex
                propagateComposedEvents: true

                onClicked: mouse.accepted = false;

                onPressed: {
                    var item = listView.itemAt(mouseX + listView.contentX, mouseY);
                    var modelData = listView.model.get(activeIndex=index);
                    if (item !== null && modelData)
                        tabView.setActiveTab(modelData.uid)
                    else
                        mouse.accepted = false;
                }

                onPressAndHold: {
                    var item = listView.itemAt(mouseX + listView.contentX, mouseY);
                    var modelData = listView.model.get(activeIndex=index)
                    if(item !== null && modelData.movable) {
                        tabView.setActiveTab(modelData.uid);
                        draggingId = modelData.uid;
                    }

                }

                onReleased: {
                    draggingId = -1
                    mouse.accepted = false;
                }

                onPositionChanged: {
                    if (draggingId != -1 && index != -1 && index != activeIndex) {
                        listView.model.move(activeIndex, activeIndex = index, 1);
                    }
                    mouse.accepted = false;

                }

                onDoubleClicked: {
                    mouse.accepted = false;
                }

                onWheel: {
                    listView.flick(wheel.angleDelta.y*10, 0);
                }

                onExited: {
                    // cancel current operation when mouse leaves the area
                    draggingId = -1;
                }
             }
        }

        ActionBar {
            Layout.preferredWidth: childrenRect.width
            actions: tabBar.actions
            iconColor: "white"
        }

    }
}
