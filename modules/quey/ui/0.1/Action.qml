/*
 * This file is part of the Quey Project
 *
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
