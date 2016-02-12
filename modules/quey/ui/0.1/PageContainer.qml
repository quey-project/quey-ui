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
import QtQuick 2.0
import quey.ui 0.1
/*!
   \qmltype PageContainer
   \inqmlmodule quey.ui
   \inherits Item
   \brief Container element for page navigation

   \c PageContainer is an abstract item to provide a container element for pages.
   PageContainers are used within of a \l PageView.
*/
Item {
    id: pageContainer
    objectName: "PageContainer"

    /*!
        Must be set to the \l PageView this container belongs to.
    */
    property Item pageView

    /*!
        A list of pages this container currently holds.
    */
    property var pages: []

    /*!
        The current page.
    */
    property var currentPage: pages.length > 0 ? pages[pages.length-1] : null

    /*!
        Condition activating the container. Defaults to \c undefined.
    */
    property bool when

    /*!
        \c true, if the current page is a sub page.
    */
    readonly property bool isSubPage: pages.length > 1

    /*!
        Condition hiding the container. Defaults to \c undefined.
    */
    property bool hidden

    /*!
        \c true if there are no \l pages attached currently.
    */
    readonly property bool isEmpty: pages.length === 0

    /*!
        This is used internally.
    */
    property QtObject d: QtObject {
        property var internalPages
    }

    visible: when && !hidden
}
