/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import QtQuick.Layouts 1.1
import quey.ui 0.1
/*!
   \qmltype PageView
   \inqmlmodule quey.ui
   \inherits Item
   \brief An abstract item that manages a set of pages inside through a defined set of containers.
*/
Item {
    objectName: "PageView"
    id: pageView

    /*!
        The list of pages this view currently holds.
    */
    property var pages: []

    /*!
        The list of containers attached to this view.
    */
    property list<Item> containers

    /*!
        Emitted when a page was pushed.
    */
    signal pagePushed (Page page)

    /*!
        Emitted when a page was popped.
    */
    signal pagePopped (Page page)

    /*!
        Add a page to the view.
    */
    function push(page) {
        // Remove page if already exists
        if (pages.indexOf(page) > -1)
            pages.splice(pages.indexOf(page), 1);
        pages.push(page);
        pagesChanged();
        page.pageView = pageView;
        page.pushed(pageView);
        pagePushed(page);
    }

    /*!
        Remove a page from the view.
    */
    function pop(page) {
        pages.splice(pages.indexOf(page), 1);
        pagesChanged();
        page.pageView = undefined;
        page.popped(pageView);
        pagePopped(page);
    }
}
