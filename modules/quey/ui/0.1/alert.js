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
.pragma library
.import QtQuick 2.4 as QtQuick
/*!
   \qmltype Alert
   \inqmlmodule quey.ui
   \brief Provides dynamic alert boxes

   \qml
    import QtQuick 2.4
    import quey.ui 0.1


    ApplicationView {
        width: Units.dp(640)
        height: Units.dp(480)

        Button {
            text: "Click me"
            anchors.centerIn: parent
            onClicked: {
                Alert.show("Alert!", "This is a very simple dialog",
                           new Alert.Button("1", function(){
                               console.log("Button 1 clicked");
                           }),
                           new Alert.Button("2", function(){
                                console.log("Button 2 clicked");
                           })
                );
            }
        }
    }
   \endqml
 */
var root
var alertDialog

/*!
    \qmlmethod Alert::show(string title, string text, Button button1, Button button2, ..., function onclosed)
    Shows an alert box.
*/
function show (title, text) {
    var buttons = [];
    if (typeof(alertDialog) != "undefined")
        alertDialog.destroy();
    alertDialog = alertComponent.createObject(root, {title: title, text: text });
    var onclosed = arguments[arguments.length-1];
    var end = arguments.length;
    if (typeof(onclosed) == "function")
        var end = arguments.length-1;
    else
        onclosed = false;

    for (var i=2; i<end; i++) {
        buttons.push(arguments[i]);
        arguments[i].clicked.connect(alertDialog.close)
    }
    alertDialog.buttons = buttons;
    if (onclosed)
        alertDialog.closed.connect(onclosed)
    alertDialog.open();
}

/*!
    \qmlmethod Alert::Button(string text, function callback)
    Dynamically constructs a button object to be used within \l show.
*/
function Button(text, callback) {
    var button = buttonComponent.createObject(null, {text: text});
    if (callback)
        button.clicked.connect(callback);
    return button;
}

var buttonComponent = Qt.createComponent("Button.qml");
var alertComponent = Qt.createComponent("MessageBox.qml");
