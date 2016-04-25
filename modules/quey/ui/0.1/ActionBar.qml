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
   \qmltype ActionBar
   \inherits Item
   \inqmlmodule quey.ui
   \brief Displays a menu and an action row. Provides the base of \l PageHeadView
 */
Item {
    id: actionBar

    /*!
      If set this property provides the \l Menu to be displayed by the integrated \l MenuButton.
    */
    property Menu menu: null

    /*!
      A list of actions. Refer to \l Action for more information.
    */
    property list<Action> actions

    /*!
      Sets the ActionBar's title.
    */
    property string title

    /*!
      If this is set to \c true a back button is displayed instead of the MenuButton if any, indicating that this is a sub page.
    */
    property bool isSubPage

    /*!
      If this is set to \c false the back button is disabled.
    */
    property bool backButtonEnabled: true

    /*!
      This property is true if \l menu is valid.
    */
    readonly property bool hasMenu: menu !== null

    /*!
      Sets the icon color. Defaults to \c Style.palette.regular.
    */
    property color iconColor: Style.palette.regular

    /*!
      Called when the user pressed the back button. The back button is only visible if \l isSubPage is set to \c true.
    */
    signal backClicked()

    height: visible ? Units.dp(48) : 0

    Row {
        id: titleRow
        anchors {
            fill: parent
            left: parent.left
            leftMargin: Style.spacing
        }

        spacing: Style.spacing

        MenuButton {
            id: menuButton
            visible: !isSubPage && hasMenu
            anchors.verticalCenter: parent.verticalCenter
            menu: actionBar.menu
            topMargin: height
        }

        IconButton {
            anchors.verticalCenter: parent.verticalCenter
            visible: isSubPage
            iconName: "arrow-left"
            iconSize: Units.dp(24)
            enabled: backButtonEnabled
            onClicked: backClicked()
        }

        Label {
            anchors.verticalCenter: parent.verticalCenter
            text: title
            font:  Style.font.subheading
        }
    }

    ActionRow {
        id: actionsRow
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: Style.spacing
        }
        actions: actionBar.actions
        iconColor: actionBar.iconColor
    }
}
