/*
 * This file is part of the Quey Project
 * Copyright (C) 2015 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import QtQuick.Window 2.1 as QtQuickWindow
/*!
   \qmltype Window
   \inqmlmodule quey.ui
   \inherits QtQuickWindow.Window
   \brief Provides a window

   Inherits \c QtQuick.Window.Window. Please refer to the \l {http://doc.qt.io/qt-5/qml-qtquick-window-window.html}{Qt documentation} for more information.
 */
QtQuickWindow.Window {
    /*!
       Opens the window. This is a duplicate of \c show.
     */
    function open() {
        show();
    }
}
