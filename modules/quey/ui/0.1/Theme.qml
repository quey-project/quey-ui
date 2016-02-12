/*
 * This file is part of the Quey Project
 * Copyright (C) 2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
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
/*!
   \qmltype Theme
   \inqmlmodule quey.ui
   \inherits Item
   \brief Provides theming support

    Allows the creation of a custom design for Quey Components.
 */
Item {

    /*!
      The theme's color palette.
    */
    property ColorPalette palette

    /*!
      The theme's font set.
    */
    property FontPalette font

    /*!
      Provides the value for inner padding (e.g. between button border and text)
    */
    property real padding

    /*!
      Provides the value for spacing in layouts (e.g. spacing between elements in a column)
    */
    property real spacing

    /*!
      The border radius for elements
    */
    property real borderRadius

    /*!
      The border width for elements
    */
    property real borderWidth

    /*!
      The default duration for color transitions.
    */
    property real colorTransitionDuration: 200

    /*!
      Returns a color with applied altered value.
    */
    function alpha(color, alpha) {
        return Qt.rgba (color.r, color.g, color.b, alpha)
    }

    /*!
      Returns the hovered version of a color.
    */
    function hoverColor (color) {
        return alpha (color, 0.3)
    }

    /*!
      Returns the disabled version of a color.
    */
    function disabledColor (color) {
        return alpha (color, 0.5)
    }
}
