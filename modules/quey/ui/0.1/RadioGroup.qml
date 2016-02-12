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
