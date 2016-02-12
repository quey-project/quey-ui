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
   \qmltype ElideLabel
   \inqmlmodule quey.ui
   \inherits Item
   \brief Provides an automatically aliding label based on \l elideWidth

   \qml
   import QtQuick 2.4
   import quey.ui 0.1

   ApplicationView {
       width: Units.dp(640)
       height: Units.dp(480)

       ElideLabel {
           anchors.centerIn: parent
           text: "Qt is awesome!"
           elideWidth: 30
       }

   }
   \endqml
 */
Item {
    id: item

    /*!
      The label's text
     */
    property string text

    /*!
      \qmlproperty color color
      The label's color.
     */
    property alias color: text.color

    /*!
      \qmlproperty font font
      The label's font.
     */
    property alias font: text.font

    /*!
      This is an alias for \l elideWidth. You can't change this property.
     */
    property alias availableWidth: item.elideWidth
    /*!
      The width avaiable for this label. Defaults to it's \c width. If this property is set, the label automatically elides if the width is greater than \c elideWidth.
     */
    property int elideWidth: width

    /*!
      The elide mode. Defaults to \c Qt.ElideRight. Possible values are:
      \list
      \li \c Qt.ElideLeft
      \li \c Qt.ElideMiddle
      \li \c Qt.ElideNone
      \li \c Qt.ElideRight
      \endlist
     */
    property int elide: Qt.ElideRight

    height: text.height

    Label {
        id: text
        text: textMetrics.elidedText

        TextMetrics {
            id: textMetrics
            text: item.text
            font: item.font
            elide: item.elide
            elideWidth: item.elideWidth
        }
    }
}
