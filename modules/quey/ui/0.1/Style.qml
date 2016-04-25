/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
pragma Singleton
import QtQuick 2.4
import quey.ui 0.1
/*!
   \qmltype Style
   \inqmlmodule quey.ui
   \inherits Item
   \brief A helper class for Quey styling

    Provides values to design user interfaces according to Quey design.
 */
Item {
    /*!
        Sets the theme that should be applied to the application.
    */
    property Theme theme: QueyTheme {
        id: theme
    }

    /*!
      Provides the Quey color palette as kind of an enumeration.
      The following properties exist:
      \list
      \li palette.green
      \li palette.blue
      \li palette.red
      \li palette.orange
      \li palette.yellow
      \li palette.purple
      \li palette.darkGrey
      \li palette.medimGrey
      \li palette.lightGrey
      \li palette.white
      \li palette.transparent
      \endlist
      \list
      \li palette.regular
      \li palette.primary
      \li palette.success
      \li palette.warning
      \li palette.danger
      \li palette.separator
      \li palette.background
      \li palette.widgetBackground
      \endlist

     */
    property alias palette: theme.palette

    /*!
      Provides fonts. Available values:
      \list
      \li font.regular
      \li font.subheading
      \li font.heading
      \li font.code
      \endlist
    */
    property alias font: theme.font

    /*!
      Provides the value for inner padding (e.g. between button border and text)
    */
    readonly property real padding: Units.dp(theme.padding)

    /*!
      Provides the value for spacing in layouts (e.g. spacing between elements in a column)
    */
    readonly property real spacing: Units.dp(theme.spacing)

    /*!
      Provides the values to design borders. Available values are:
      \list
      \li border.radius
      \li border.width
      \endlist
    */
    property QtObject border: QtObject {
        id: border
        readonly property real radius: Units.dp(theme.borderRadius)
        readonly property real width: Units.dp(theme.borderWidth)
    }

    /*!
      The default duration for color transitions.
    */
    readonly property real colorTransitionDuration: theme.colorTransitionDuration

    /*!
      Returns a color with applied altered value.
    */
    function alpha(color, alpha) {
        return Qt.rgba (color.r, color.g, color.b, alpha)
    }

    /*!
      Returns the hovered version of a color.
    */
    function hoverColor (color) { return theme.hoverColor(color) }

    /*!
      Returns the disabled version of a color.
    */
    function disabledColor (color) { return theme.hoverColor (color) }
}
