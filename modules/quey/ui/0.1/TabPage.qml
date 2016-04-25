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
/*!
   \qmltype TabPage
   \inqmlmodule quey.ui
   \inherits Page
   \brief Page component to be used in combination with \l TabView
 */
Page {
    objectName: "TabPage"
    visible: false

    /*!
        Sets the icon name for the tab. This will pick the icon with the given name from the current theme.
    */
    property string iconName

    /*!
        Set this to \c true if the tab should be closable. Defaults to \c false.
    */
    property bool closable: false

    /*!
        Set this to \c true if the tab should be movable. Defaults to \c false.
    */
    property bool movable: false

    /*!
        The internally used tab id.
    */
    property int uid: -1

    /*!
        The parent \l TabView.
    */
    property TabView tabView

    /*!
        Closes this tab.
    */
    function close(){
        tabView.removeTab(uid);
    }
}
