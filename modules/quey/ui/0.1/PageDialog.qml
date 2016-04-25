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


