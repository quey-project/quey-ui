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
import QtQuick.Controls 1.3 as Controls
/*!
   \qmltype Action
   \inherits QtQuick.Controls.Action
   \inqmlmodule quey.ui
   \brief Provides an abstract user interface action that can be bound to items.

   One of the most common uses of actions is displaying actions in the action bar of a page
   using the \l Page::actions property. See the example for \l Page for more details.

   \qml
   import QtQuick 2.4
   import quey.ui 0.1

   Page {
       actions: [
           Action {
               text: "MyAction"
               iconName: "paw"
               onTriggered: {
                   console.log("Action triggered!")
               }
           }
       ]
   }
   \endqml

   Inherits \c QtQuick.Controls.Action. Please refer to the \l {http://doc.qt.io/qt-5/qml-qtquick-controls-action.html}{Qt documentation} for more information.
 */
Controls.Action {
    /*!
        Set \l visible to false to hide the visual representation of this action.
    */
    property bool visible: true

}
