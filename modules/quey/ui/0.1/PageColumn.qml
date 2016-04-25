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
        backButtonEnabled: currentPage && !currentPage.fixed
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
