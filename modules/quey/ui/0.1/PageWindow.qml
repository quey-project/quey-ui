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
