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
        pagePushed(page);
    }

    /*!
        Remove a page from the view.
    */
    function pop(page) {
        pages.splice(pages.indexOf(page), 1);
        pagesChanged();
        pagePopped(page);
    }
}
