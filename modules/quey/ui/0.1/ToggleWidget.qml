/*
 * This file is part of the Quey Project
 * Copyright (C) 2015 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
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
import QtQuick.Layouts 1.0
import quey.ui 0.1

RowLayout {
    id: toggleWidget
    property list<ToggleWidgetItem> items
    property int currentIndex
    property Item currentWidget: items[currentIndex].widget

    implicitWidth: Units.dp(256)
    implicitHeight: Units.dp(48)

    spacing: Style.spacing

    property bool enableScrolling: true

    Item {
        id: container
        width: childrenRect.width
        height: childrenRect.height
        children: [
            currentWidget
        ]
    }

    MenuButton {
        topMargin: toggleWidget.height/2
        menu: Menu {
            id: menu
            items: toggleWidget.items
            itemDelegate: Component {
                MenuListItem {
                    width: parent.width
                    iconName: model.iconName
                    text: model.text
                    textColor: currentIndex === index ? "white" : Style.palette.regular
                    backgroundColor: currentIndex == index ? Style.palette.regular : Style.palette.background
                    onClicked: {
                        currentIndex = index;
                        menu.close();
                    }
                }
            }
        }
    }

    ModestMouseArea {
        anchors.fill: parent
        onWheel: {
            if (enableScrolling) {
                if (wheel.angleDelta.y > 0)
                    currentIndex > 0 ? currentIndex-- : currentIndex = items.length-1;
                else if (wheel.angleDelta.y < 0)
                    currentIndex < items.length-1 ? currentIndex++ : currentIndex = 0;
                wheel.accepted = false;
            }
        }
    }
}
