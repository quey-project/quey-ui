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
   \qmltype ActivityIndicator
   \inherits Item
   \inqmlmodule quey.ui
   \brief Indicates background activity of a task of unknown duration.

   \qml
   import QtQuick 2.4
   import quey.ui 0.1

   ApplicationView {
       ActivityIndicator {
          anchors.centerIn: parent
          running: true
       }
   }
   \endqml

 */
Item {
    id: activityIndicator
    width: row.childrenRect.width
    height: Units.dp(32)
    visible: running

    /*!
      Set this to true when the indicator should be shown. If set to false the indicator is not visible.
    */
    property bool running

    /*!
      The indicator's color. Defaults to \c Style.palette.regular
    */
    property color color: Style.palette.regular

    /*!
      The animation duration. Defaults to 200.
    */
    property real duration: 200

    /*!
      Sets the number of circles to be drawn as part of the animation. Defaults to 3.
    */
    property real circlesCount: 3

    objectName: "ActivityIndicator"

    Row {
        id: row
        anchors.fill: parent
        spacing: Style.spacing / 2

        property real currentIndex: -1

        Repeater {
            id: repeater
            model: circlesCount


            Item {
                width: Units.dp(24)
                height: width

                function blink () {
                    circle.collapsing = false;
                    collapseTimer.start()
                }

                Timer {
                    id: collapseTimer
                    interval: activityIndicator.duration
                    onTriggered: {
                        circle.collapsing = true;
                    }
                }

                Circle {
                    id: circle
                    property bool collapsing: true
                    property real duration: activityIndicator.duration
                    anchors.centerIn: parent

                    color: collapsing ? Style.alpha(activityIndicator.color, 0.2) : activityIndicator.color
                    width: collapsing ? Units.dp(14) : Units.dp(24)

                    Behavior on color {
                        ColorAnimation {
                            duration: circle.duration
                        }
                    }
                    Behavior on width {
                        NumberAnimation {
                            duration: circle.duration
                            easing.type: Easing.InOutQuad
                        }
                    }

                }
            }
        }

        Timer {
            interval: activityIndicator.duration
            running: true
            repeat: true
            triggeredOnStart: true
            onTriggered: {
                row.currentIndex++;
                if (row.currentIndex >= repeater.model)
                    row.currentIndex = 0;
                var item = repeater.itemAt(row.currentIndex);
                item.blink();
            }
        }

    }

}

