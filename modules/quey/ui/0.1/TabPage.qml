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
