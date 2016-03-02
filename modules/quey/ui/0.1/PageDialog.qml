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
   \qmltype PageDialog
   \inqmlmodule quey.ui
   \inherits Item
   \brief A \l PageContainer in form of a \l Dialog.
*/
PageContainer {
    id: pageContainer

    parent: pageView

    /*!
        The maximum height of the dialog.
    */
    property alias maximumHeight: dialog.maximumHeight
    /*!
        The maximum width of the dialog.
    */
    property alias maximumWidth: dialog.maximumWidth
    /*!
        Set this to \c true if the dialog should hide on tap.
    */
    property alias dismissOnTap: dialog.dismissOnTap

    onCurrentPageChanged: {
        if (currentPage !== null)
            dialog.open();
        else {
            dialog.automaticClose = true;
            dialog.close();
        }
    }

    Dialog {
        id: dialog

        dismissOnTap: false

        property bool automaticClose: false

        objectName: "PageDialog"

        property Item pageView

        title: pageContainer.currentPage !== null ? pageContainer.currentPage.title : ""

        contentMargins: 0

        onClosed: {
            if (!automaticClose)
                pageContainer.pageView.pop(pageContainer.currentPage);
            dialog.automaticClose = false;
        }

        content: PageContentView {
            width: dialog.contentAvailableWidth
            height: dialog.contentAvailableHeight
            page: pageContainer.currentPage

        }

    }

}


