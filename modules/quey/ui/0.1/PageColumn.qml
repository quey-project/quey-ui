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
   \qmltype PageColumn
   \inqmlmodule quey.ui
   \inherits PageContainer
   \brief A \l PageContainer used to display pages as columns.
*/
PageContainer {
    id: pageColumn
    objectName: "PageColumn"

    pageView: parent.objectName === "PageView" ? parent : (parent.objectName === "PageViewLayout" ? parent.pageView : null)

    Layout.fillHeight: true

    PageHeadView {
        id: pageHeadView
        actions: currentPage !== null ? currentPage.actions: null
        menu: currentPage !== null && currentPage.hasMenu ? currentPage.menu: null
        visible: currentPage && currentPage.showHeader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        onBackClicked: {
            pageView.pop(currentPage);
        }

        title: currentPage !== null ? currentPage.title : ""
        isSubPage: pageColumn.isSubPage
    }

    PageContentView {
        page: currentPage
        anchors.top: pageHeadView.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }

}
