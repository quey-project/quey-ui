/*
 * This file is part of the Quey Project
 *
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
    property color iconColor: Style.palette.regular

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
