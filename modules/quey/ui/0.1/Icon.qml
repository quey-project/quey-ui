/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtQuick.Window 2.2
import quey.ui 0.1
/*!
   \qmltype Icon
   \inqmlmodule quey.ui
   \inherits Item
   \brief Provides an icon

   Quey UI provides the \l {http://ionicons.com/} {Ionicons} icon set but with renamed icon names. Look \l {https://github.com/tim-sueberkrueb/ionicons-svg} {here} for the icon names.

   \qml
    import QtQuick 2.4
    import quey.ui 0.1
    import Qt.labs.folderlistmodel 2.1

    ApplicationView {
        width: Units.dp(640)
        height: Units.dp(480)

        Flickable {
            anchors.fill: parent
            contentHeight: flow.childrenRect.height

            Flow {
                id: flow
                width: parent.width

                Icon { id: icon }

                Repeater {
                    model: FolderListModel {
                        id: folderModel
                        folder: icon.iconDirectory
                        nameFilters: ["*.svg"]
                    }

                    delegate: Icon {
                        source: Qt.resolvedUrl("file://"+filePath)
                        Component.onCompleted: console.log(filePath)
                    }
                }
            }
        }
    }
   \endqml
*/
Item {
    id: item

    /*!
     The icon size. This is equal to width and height of the icon.
    */
    property real size: Units.dp(24)

    /*!
     The icon name. This will pick the icon with the given name from the installed icon set.
    */
    property string name: ""

    /*!
     The icon source. Can be used instead of /l name.
    */
    property url source: ""

    /*!
     The icon color.
    */
    property color color: Style.palette.regular

    /*
     The icon set directory.
    */
    property string iconDirectory: Qt.resolvedUrl("../icons/")

    width: size
    height: size

    Image {
        id: image
        anchors.fill: parent
        visible: false
        source: item.source != "" ? item.source : (name != "" ? Qt.resolvedUrl(iconDirectory + name + ".svg") : Qt.resolvedUrl(""))

        sourceSize {
            width: size * Screen.devicePixelRatio
            height: size * Screen.devicePixelRatio
        }
    }

    ColorOverlay {
        id: overlay

        anchors.fill: parent
        source: image
        color: Style.alpha(item.color, 1)
        cached: true
        visible: image.source !== ""
        opacity: item.color.a
    }

}
