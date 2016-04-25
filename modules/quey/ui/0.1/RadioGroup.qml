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
   \qmltype RadioGroup
   \inqmlmodule quey.ui
   \inherits Column
   \brief Provides a column of radio buttons.
*/
Column {
    objectName: "RadioGroup"

    width: childrenRect.width
    height: childrenRect.height

    spacing: Style.spacing

    property int selectedIndex: -1
    property Item selectedItem: selectedIndex > -1 && selectedIndex < children.length ? children[selectedIndex] : null

    signal itemSelected (Item item)
    onItemSelected: {
        if (selectedItem)
            selectedItem.selected = false;
        for (var i=0; i<children.length; i++) {
            if (children[i] === item) {
                selectedIndex = i;
                return true;
            }
        }
        return false;
    }

}
