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
   \qmltype DefaultTheme
   \inqmlmodule quey.ui
   \inherits Theme
   \brief The default Quey theme

   Provides a cute and minimalistic theme with rounded corners.
 */
Theme {
    id: theme

    palette: ColorPalette {
        green: "#69D554"
        blue: "#5469d5"
        red: "#d55469"
        orange: "#d57f54"
        yellow: "#d5bf54"
        purple: "#962aab"
        darkGrey: "#2D2D2D"
        mediumGrey: "#585858"
        lightGrey: "#C6C6C6"
        transparent: "transparent"
        white: "white"

        regular: palette.mediumGrey
        background: white
        widgetBackground: palette.transparent
        primary: palette.blue
        success: palette.green
        warning: palette.orange
        danger: palette.red
        separator: alpha(palette.lightGrey, 0.2)
    }

    FontLoader {
        id: hackRegular
        source: "../fonts/Hack/Hack-Regular.ttf"
    }

    FontLoader {
        id: encodeSansRegular
        source: "../fonts/Encode-Sans/EncodeSans-Regular.ttf"
    }

    font: FontPalette {

        regular: Qt.font({
            family: encodeSansRegular.name,
            pixelSize: 16
        })

        subheading: Qt.font({
            family: encodeSansRegular.name,
            pixelSize: 18
        })

        heading: Qt.font({
            family: encodeSansRegular.name,
            pixelSize: 20
        })

        code: Qt.font({
            family: hackRegular.name,
            pixelSize: 16
        })
    }

    padding: 8
    spacing: 16
    borderRadius: 7
    borderWidth: 2
    colorTransitionDuration: 200

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
