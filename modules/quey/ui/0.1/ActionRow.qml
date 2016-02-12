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
/*!
   \qmltype ActionRow
   \inherits Row
   \inqmlmodule quey.ui
   \brief Displays a row of Actions.

   See \l Action for more information.
 */
Row {
    id: actionsRow

    LayoutMirroring.enabled: true
    LayoutMirroring.childrenInherit: true

    layoutDirection: Qt.RightToLeft
    spacing: Style.spacing

    /*!
      The list of actions to be displayed. See \l Action.
    */
    property list<Action> actions

    /*!
      The icon color.
    */
    property color iconColor

    Repeater {
        model: actions
        delegate: IconButton {
            enabled: model.enabled != undefined ? model.enabled : true
            visible: model.visible != undefined ? model.visible : true
            iconName: model.iconName ? model.iconName : "help-empty"
            iconColor: actionsRow.iconColor
            onClicked: actions[index].triggered()
        }
    }
}
