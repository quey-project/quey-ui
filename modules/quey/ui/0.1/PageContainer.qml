/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
