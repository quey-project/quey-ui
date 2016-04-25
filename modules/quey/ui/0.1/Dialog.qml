/*
 * Part of this code is based on QML-Material (https://github.com/papyros/qml-material/)
 * Quey Modificatons
 * Copyright (C) 2015-2016 Tim Süberkrüb (https://github.com/tim-sueberkrueb)
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2014-2015 Michael Spencer <sonrisesoftware@gmail.com>
 *               2015 Bogdan Cuza <bogdan.cuza@hotmail.com>
 *               2015 Mikhail Ivchenko <ematirov@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import QtQuick 2.4
import QtQuick.Layouts 1.1
import quey.ui 0.1
/*!
   \qmltype Dialog
   \inqmlmodule quey.ui
   \inherits PopupBase
   \brief A dialog component.

   \l Dialog is a feature rich window component for the use as modal dialog. It's both suitable as a simple message box
   as well as an advanced modal (for example to show settings).

   \qml
    import QtQuick 2.4
    import quey.ui 0.1

    ApplicationView {
        Button {
            anchors.centerIn: parent
            text: "Open Dialog"
            onClicked: dialog.open()
        }

        Dialog {
            id: dialog
            maximumWidth: Units.dp(640)
            maximumHeight: Units.dp(480)
            title: "My Dialog"
            text: "Hello World"
        }
    }
   \endqml

   In this example we made use of the \l title and \l text properties which make it very easy to create a slick message box without much effort.
   However, it's also possible to set a custom content item instead:

   \qml
    Dialog {
        id: dialog
        title: "Dialog with custom content"

        content: Column {
            width: childrenRect.width
            height: childrenRect.height

            spacing: Style.spacing

            WrapLabel {
                id: label
                availableWidth: dialog.contentAvailableWidth
                text: "This text will be wrapped based on the dialog's available width."
            }

            ActivityIndicator {
                running: checkbox.checked
            }

            CheckBox {
                id: checkbox
                text: "running"
            }

            Row {
                spacing: Style.spacing
                width: Math.max(childrenRect.width, label.width)
                layoutDirection: Qt.RightToLeft

                Button {
                    text: "no"
                }

                Button {
                    text: "yes"
                }
            }
        }
    }
   \endqml
 */
PopupBase {
    id: dialog

    overlayLayer: "dialogOverlayLayer"
    overlayColor: Qt.rgba(0, 0, 0, 0.3)

    opacity: showing ? 1 : 0
    visible: opacity > 0

    width: Math.min(Math.max(content.width + 2 * contentMargins, minimumWidth), appliedMaximumWidth)
    height: Math.min(Math.max( contentHeight, minimumHeight), appliedMaximumHeight)


    /*!
      This property sets the maximum width of the dialog.
    */
    property int maximumWidth: parent.width - Units.dp(64)

    /*!
      This property sets the minimum width of the dialog.
    */
    property int minimumWidth: Device.isMobile ? Units.dp(280) : Units.dp(300)

    /*!
      This property sets the minimum height of the dialog.
    */
    property int minimumHeight: Device.isMobile ? Units.dp(280) : Units.dp(300)

    /*!
      This property sets the maximum height of the dialog.
    */
    property int maximumHeight: parent.height - Units.dp(64)

    /*!
      The margins of the \l content item. Defaults to \c 24
    */
    property int contentMargins: Units.dp(24)

    /*!
      The dialog's title.
    */
    property string title

    /*!
      The dialog's text to be rendered instead of a custom \l content Item.
    */
    property string text

    /*!
      This property holds the actual maximum width that can be applied. Used internally.
    */
    readonly property int appliedMaximumWidth: Math.min(maximumWidth, (parent.width - Units.dp(64)))

    /*!
      This property holds the actual maximum height that can be applied. Used internally.
    */
    readonly property int appliedMaximumHeight: Math.min(maximumHeight, (parent.height - Units.dp(64)))

    /*!
      The height of the dialogs content.
    */
    readonly property int contentHeight: content.height + rowTitle.height + rowTitle.anchors.topMargin + separator.height + separator.anchors.topMargin + 2 * contentMargins

    /*!
      The width available to the dialog content based on the margins and maximum width.
    */
    readonly property int contentAvailableWidth: appliedMaximumWidth - dialog.contentMargins * 2

    /*!
      The height available to the dialog content.
    */
    readonly property int contentAvailableHeight: appliedMaximumHeight - (rowTitle.height + rowTitle.anchors.topMargin + separator.height + separator.anchors.topMargin + 2 * contentMargins)

    /*!
      If set to \c true the dialog is closed when pressing the close key.
    */
    property bool dismissOnCloseKey: true

    /*!
      Emitted when the close key was pressed.
    */
    signal closeKeyPressed (var event)

    /*!
      If set to true, the content is flickable.
    */
    property bool flickable: true

    anchors {
        centerIn: parent
        verticalCenterOffset: showing ? 0 : -(dialog.height/3)

        Behavior on verticalCenterOffset {
            NumberAnimation { duration: 200 }
        }
    }

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Escape) {
            closeKeyPressed(event)
        }
    }

    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            closeKeyPressed(event)
        }
    }

    onCloseKeyPressed: {
        if (dialog.showing) {
            if (dialog.dismissOnCloseKey) {
                dialog.close()
            }
            if (event)
                event.accepted = true
        }
    }

    /*!
      Allows assigning custom content to the dialog. To be used instead of \l text.
    */
    property Item content: WrapLabel {
        id: label
        text: dialog.text
        property real maximumWidth: dialog.appliedMaximumWidth - dialog.contentMargins * 2
        availableWidth: maximumWidth
        height: paintedHeight
        parent: contentContainer.contentItem
    }

    onContentChanged: content.parent = contentContainer.contentItem

    Elevator {
        id: elevator

        anchors.fill: parent

        source: QueyShape {
            width: dialog.width
            height: dialog.height
            border.width: 0
            color: Style.palette.white

            RowLayout {
                id: rowTitle
                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top

                    topMargin: Style.padding
                    leftMargin: Units.dp(24)
                    rightMargin: Units.dp(24)
                }

                height: Units.dp(48)

                ElideLabel {
                    text: title
                    elide: Qt.ElideRight
                    elideWidth: dialog.contentAvailableWidth - closeIcon.width
                    font: Style.font.subheading
                }

                Icon {
                    id: closeIcon
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    name: "close-round"
                    size: Units.dp(12)

                    MouseArea {
                        anchors.fill: parent
                        onClicked: dialog.close()
                    }
                }

            }

            Separator {
                id: separator
                anchors.top: rowTitle.bottom
                anchors.topMargin: Style.padding
                width: parent.width
            }

            Flickable {
                id: contentContainer
                interactive: (contentHeight > height || contentWidth > width) && flickable
                anchors {
                    top: separator.top
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                    margins: contentMargins
                }
                clip: true

                contentHeight: content.height
                contentWidth: content.width
            }

        }

    }

}
