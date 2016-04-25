/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4 as QtQuick
/*!
   \qmltype ListView
   \inqmlmodule quey.ui
   \brief Provides a list view.

   \qml
    import QtQuick 2.4
    import quey.ui 0.1

    ApplicationView {
        ListView {
            anchors.fill: parent

            delegate: ListItem {
                width: parent.width
                Label {
                    anchors.centerIn: parent
                    text: index+1
                }
            }

            model: 30
        }
    }
   \endqml

   \l ListView is based on \c QtQuick.ListView. Please refer to the \l {doc.qt.io/qt-5/qml-qtquick-listview.html}{Qt documentation} for more information.
 */
QtQuick.ListView {
    id: listView
    objectName: "ListView"
    clip: true
}
