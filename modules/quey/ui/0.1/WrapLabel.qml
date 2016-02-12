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
