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
import QtQuick.Layouts 1.1
import quey.ui 0.1
/*!
   \qmltype Menu
   \inqmlmodule quey.ui
   \brief Displays a menu

   \qml
    import QtQuick 2.4
    import quey.ui 0.1

    ApplicationView {
        width: 640
        height: 480

        MenuButton {
            id: button
            anchors.centerIn: parent
            menu: Menu {
                parent: button
                items: [
                    MenuItem {
                        text: "File"
                        iconName: "open"
                        actions: [
                            Action {
                                text: "New"
                                onTriggered: console.log("New triggered")
                            },
                            Action {
                                text: "Open"
                                onTriggered: console.log("Open triggered")
                            }
                        ]
                    },
                    MenuItem {
                        text: "Edit"
                        iconName: "edit"
                        onTriggered: console.log("Edit triggered")
                    },
                    MenuItem {
                        text: "Quit"
                        onTriggered: Qt.quit()
                    }

                ]
            }
        }
    }
   \endqml
 */
PopupBase {
    id: menu

    closeOnResize: true

    overlayLayer: "menuOverlayLayer"
    overlayColor: Qt.rgba(0, 0, 0, 0)

    opacity: showing ? 1 : 0
    visible: opacity > 0

    width: Units.dp(256)
    height: Math.min(selectedItem ? subListView.contentHeight + subTitleItem.height : baseListView.contentHeight, availableHeight)

    Behavior on height {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    /*!
      The available hight. Defaults to the parent height.
     */
    property real availableHeight: parent ? parent.height: 0

    /*!
      A list of \l MenuItem.
     */
    property list<MenuItem> items

    /*!
       The currently selected item.
     */
    property var selectedItem: null

    /*!
       Emitted when an item was triggered.
     */
    signal itemTriggered (int index)

    onClosed: {
        selectedItem = null;
    }

    /*!
      This delegate represents the \l items visually. Defaults to a \l MenuListItem.
     */
    property Component itemDelegate: Component {
        MenuListItem {
            width: parent.width
            iconName: model.iconName
            enabled: model.enabled
            text: model.text
            hasSubMenu: items[index].actions.length > 0
            onClicked: {
                if (hasSubMenu)
                    menu.selectedItem = items[index];
                else {
                    items[index].triggered();
                    menu.itemTriggered(index);
                    menu.close();
                }
            }
        }
    }

    Elevator {
        id: elevator

        anchors.fill: parent

        source: Rectangle {
            width: menu.width
            height: menu.height
            color: Style.palette.background

            ListView {
                id: baseListView
                model: items
                interactive: contentHeight > parent.height
                anchors.fill: parent
                delegate: itemDelegate
            }

            Rectangle {
                property bool showing: menu.selectedItem !== null
                x: showing ? 0 : menu.width
                opacity: showing ? 1 : 0

                Behavior on x {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }

                Behavior on opacity {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }

                color: Style.palette.background
                width: menu.width - x
                height: menu.height

                MenuListItem {
                    id: subTitleItem
                    anchors {
                        top: parent.top
                        left: parent.left
                        right: parent.right
                    }
                    iconName: "arrow-left"
                    text: menu.selectedItem ? menu.selectedItem.text : ""
                    onClicked: menu.selectedItem = null
                }

                ListView {
                    id: subListView
                    anchors {
                        top: subTitleItem.bottom
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    model: menu.selectedItem ? menu.selectedItem.actions : 0
                    interactive: contentHeight > parent.height
                    delegate: MenuListItem {
                        width: parent.width
                        visible: model.visible
                        enabled: model.enabled
                        iconName: model.iconName
                        text: model.text
                        onClicked: {
                            menu.selectedItem.actions[index].triggered()
                            menu.close();
                        }
                    }
                }
            }
        }
    }
}
