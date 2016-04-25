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
   \qmltype ModestMouseArea
   \inherits MouseArea
   \inqmlmodule quey.ui
   \brief A \c MouseArea that allows to simply pass specified events.
 */
MouseArea {
    propagateComposedEvents: true

    property bool passClicked: true
    property bool passPressed: true
    property bool passPressAndHold: true
    property bool passReleased: true
    property bool passPositionChanged: true
    property bool passDoubleClicked: true
    property bool passWheel: true

    onClicked: if (passClicked) mouse.accepted = false;
    onPressed: if (passPressed) mouse.accepted = false;
    onPressAndHold: if (passPressAndHold) mouse.accepted = false;
    onReleased: if (passReleased) mouse.accepted = false;
    onPositionChanged: if(passPositionChanged) mouse.accepted = false;
    onDoubleClicked: if(passDoubleClicked) mouse.accepted = false;
    onWheel: if (passWheel) wheel.accepted = false;
}
