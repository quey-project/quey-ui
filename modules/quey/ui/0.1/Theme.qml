/*
 * This file is part of the Quey Project
 * Copyright (C) 2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
