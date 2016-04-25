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
   \qmltype CheckBox
   \inqmlmodule quey.ui
   \inherits Item
   \brief A checkbox component

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

           CheckBox {
               id: checkbox
               text: "Activity indicator"
           }

           ActivityIndicator {
               running: checkbox.checked
               color: Style.palette.success
           }

       }
   }
   \endqml
 */
Item {
    objectName: "CheckBox"
    id: item

    width: row.width
    height: row.height

    /*!
      The checkbox' color. Defaults to \c Style.palette.regular.
    */
    property color color: Style.palette.regular


    /*!
      The text to be displayed next to the checkbox.
    */
    property string text

    /*!
      This property is true if the checkbox is checked.
    */
    property bool checked: false

    /*!
      \qmlproperty bool pressed
      This property is true when the left mouse button is pressed down over the checkbox.
    */
    property alias pressed: mouseArea.pressed

    /*!
      \qmlproperty bool hovered
      This property is true when the mouse pointer hovers the checkbox.
    */
    property alias hovered: mouseArea.containsMouse

    /*!
      This signal gets triggered when the checkbox was clicked.
    */
    signal clicked ()

    Row {
        id: row
        spacing: Style.padding

        QueyShape {
            height: Units.dp(24)
            width: height

            anchors.verticalCenter: parent.verticalCenter

            border.color: enabled ? item.color : Style.disabledColor(item.color)

            color: checked ? item.color : (hovered ? Style.hoverColor(item.color): Style.palette.widgetBackground)

            property alias text: label.text

            Behavior on color {
                ColorAnimation {
                    duration: Style.colorTransitionDuration
                }
            }

            Icon {
                visible: checked
                opacity: visible ? 1 : 0
                anchors.centerIn: parent
                size: Units.dp(12)
                color: Style.palette.white
                name: "checkmark-round"

                Behavior on opacity {
                    NumberAnimation {
                        duration: Style.colorTransitionDuration
                    }
                }
            }

        }

        Label {
            id: label
            anchors.verticalCenter: parent.verticalCenter

            color: enabled ? item.color : Style.disabledColor(item.color)
            text: item.text
        }

    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            item.clicked();
            checked = !checked
        }
    }
}
