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
   \qmltype WrapLabel
   \inqmlmodule quey.ui
   \inherits Label
   \brief A \l Label that automatically wraps the text based on it's \l availableWidth
 */
Label {
    /*!
        According to this property the label automatically wraps the text.
    */
    property int availableWidth

    width: availableWidth ? Math.min(availableWidth, metrics.width): metrics.width

    wrapMode: Text.WordWrap
    clip: true
}
