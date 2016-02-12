/*
 * This file is part of the Quey Project
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import QtQuick 2.4
import quey.ui 0.1


ApplicationView {
    width: Units.dp(640)
    height: Units.dp(480)

    ToggleWidget {
        anchors.centerIn: parent

        items: [
            ToggleWidgetItem {
                widget: TextField {

                }
                title: "TextField"
            },
            ToggleWidgetItem {
                widget: CheckBox {
                    text: "Hallo :)"
                }
                title: "Checkbox"
            },
            ToggleWidgetItem {
                widget: Button {
                    text: "Hallo :)"
                }
                title: "Button"
            },
            ToggleWidgetItem {
                widget: Rectangle {
                    width: Units.dp(100)
                    height: Units.dp(300)
                    color: Style.palette.green
                }
                title: "Rectangle"
            }
        ]
    }

}
