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
   \qmltype PageWindow
   \inqmlmodule quey.ui
   \inherits PageContainer
   \brief A \l PageContainer in form of a window.
*/
PageContainer {
    id: pageWindow

    property alias window: window.width

    onCurrentPageChanged: {
        if (currentPage !== null) {
            if (!window.visible)
                window.show();
        }
        else if (window.visible) {
            window.userInitiatedClose = false;
            window.close();
        }
    }

    signal closing (bool userInitiated)

    Window {
        id: window

        width: pageWindow.width
        height: pageWindow.height

        objectName: "PageWindow"

        property Item pageView

        property bool userInitiatedClose: true

        title: pageWindow.currentPage !== null ? pageWindow.currentPage.title : ""

        onClosing: {
            if (userInitiatedClose)
                pageWindow.pageView.pop(pageWindow.currentPage);
            pageWindow.closing(userInitiatedClose)
            window.userInitiatedClose = true;
        }

        PageContentView {
            anchors.fill: parent
            page: pageWindow.currentPage
        }

    }

}
