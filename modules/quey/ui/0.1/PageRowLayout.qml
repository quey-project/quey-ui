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
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import quey.ui 0.1
/*!
   \qmltype PagesplitView
   \inqmlmodule quey.ui
   \inherits PageView
   \brief A \l PageView that displays a set of PageColumns as row.
*/
PageView {
    objectName: "PageView"
    id: pageView

    /*!
        Used internally.
    */
    property QtObject d: QtObject {
        // Internal property handling containers functioning as columns in the layout
        property var columns: []

        function refreshColumns() {
            for (var c=0; c < containers.length; c++) {
                var container = containers[c];
                if (container.objectName === "PageColumn"  && d.columns.indexOf(container) === -1)
                    d.columns.push(container);
            }
        }

        function apply() {
            // Clear the internal pages
            for (var columnIndex=0; columnIndex < containers.length; columnIndex++) {
                var container = containers[columnIndex];
                container.d.internalPages = [];
            }

            // Assign pages to internal pages
            for (var pageIndex=0; pageIndex < pages.length; pageIndex++) {
                var page = pages[pageIndex];
                for (var i=0; i<page.containers.length; i++) {
                    var c = page.containers[i];
                    if (c.when) {
                        c.d.internalPages.push(page);
                        break;
                    }
                }
            }

            // Assign internal property to "real" property, triggers containers events
            for (var c=0; c < containers.length; c++) {
                var container = containers[c];
                container.pages = container.d.internalPages;
            }
        }
    }

    onWidthChanged: d.apply()
    onPagePopped: d.apply()
    onPagePushed: d.apply()
    onContainersChanged: d.refreshColumns()

    SplitView {
        id: splitView
        objectName: "PageViewLayout"

        property alias pageView: pageView

        anchors.fill: parent

        Component.onCompleted: {
            for (var i=0; i<d.columns.length; i++) {
                splitView.addItem(d.columns[i])
            }
        }
    }
}
