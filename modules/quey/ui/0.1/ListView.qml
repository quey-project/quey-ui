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
