/*
 * This file is part of the Quey Project
 *
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import quey.ui 0.1
/*!
   \qmltype Button
   \inqmlmodule quey.ui
   \inherits Item
   \brief A simple button component

   \qml
   import QtQuick 2.4
   import quey.ui 0.1

   ApplicationView {
       width: Units.dp(640)
       height: Units.dp(480)

       Column {
           anchors.fill: parent
           anchors.margins: Style.spacing
           spacing: Style.spacing

           Button {
               text: "Regular"
               onClicked: {
                   console.log("Keep calm - keep coding :)")
               }
           }

           Button {
               text: "Warning"
               color: Style.palette.warning
           }

           Button {
               text: "Success"
               color: Style.palette.success
           }

       }
   }
   \endqml
 */
Item {
    objectName: "Button"
    id: item

    implicitHeight: Units.dp(38)
    implicitWidth: minimumWidth
    width: Math.max(label.paintedWidth + Style.padding * 2, minimumWidth)

    /*!
      The minimum width of the button. Defaults to \c 94.
    */
    property int minimumWidth: Units.dp(94)

    /*!
      The button's color. Defaults to \c Style.palette.regular.
    */
    property color color: Style.palette.regular

    /*!
      The button's text. The button is automatically expanded based on the length of the text. To supress this behaivour assign a value to \c width.
    */
    property string text

    /*!
      \qmlproperty bool pressed
      This property is true when the left mouse button is pressed down over the button.
    */
    property alias pressed: mouseArea.pressed

    /*!
      \qmlproperty bool hovered
      This property is true when the mouse pointer hovers the button.
    */
    property alias hovered: mouseArea.containsMouse

    /*!
      This signal gets triggered when the button was clicked.
    */
    signal clicked ()

    QueyShape {
        id: background

        anchors.fill: parent

        border.color: enabled ? item.color : Style.disabledColor(item.color)

        color: hovered && pressed ? item.color : (hovered ? Style.hoverColor(item.color): Style.palette.widgetBackground)

        property alias text: label.text

        Behavior on color {
            ColorAnimation {
                duration: Style.colorTransitionDuration
            }

        }
    }

    Label {
        id: label
        text: item.text
        color:  (pressed && hovered) ? Style.palette.white : (enabled ? item.color : Style.disabledColor(item.color))
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        onClicked: item.clicked()
    }
}
