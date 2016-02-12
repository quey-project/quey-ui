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
import QtQuick 2.4
import quey.ui 0.1
/*!
   \qmltype TabView
   \inqmlmodule quey.ui
   \inherits Item
   \brief Provides a tabbed view

   \qml
    import QtQuick 2.4
    import quey.ui 0.1


    ApplicationView {
        width: Units.dp(640)
        height: Units.dp(480)

        TabView {
            id: tabView
            anchors.fill: parent

            menu: Menu {
                items: [
                    MenuItem {
                        text: "File"
                    }
                ]
            }

            actions: [
                Action {
                    iconName: "plus"
                }
            ]

            TabPage {
                title: "Main"

                Label {
                    anchors.centerIn: parent
                    text: "Something"
                }
            }

        }

        Component {
            id: myTabPage

            TabPage {
                id: page

                closable: true
                movable: true

                Button {
                    anchors.centerIn: parent
                    text: page.title
                }
            }
        }

        Component.onCompleted: {
            for (var i=0; i<5; i++) {
                var page = myTabPage.createObject(null, {title: "My Tab " + i.toString()})
                tabView.addTab(page)
            }
        }
    }
    \endqml

 */
Item {
    id: tabView
    objectName: "TabView"

    /*!
        A model of tabs. Used internally.
    */
    property ListModel tabsModel: ListModel {}

    /*!
        Holds the current tab.
    */
    property var activeTab

    /*!
        Holds the last active tab.
    */
    property var lastActiveTab

    /*!
        A list of tabs ordered by their activation time.
    */
    property var activeTabHistory: []

    /*!
        The last internally used tab id.
    */
    property int lastTabUID: 0

    /*!
        An attached \l Menu.
    */
    property Menu menu

    /*!
        A list of actions to be displayed next to the tab bar.
    */
    property list<Action> actions

    /*!
        Emitted if the last tab was closed.
    */
    signal lastTabClosed()

    onActiveTabChanged: {
        // Handle last active tab
        if (lastActiveTab !== undefined && lastActiveTab !== null && lastActiveTab !== false) {
            lastActiveTab.state = "inactive";
            lastActiveTab.view.visible = false;
        }
        // Handle now active tab
        if (activeTab) {
            lastActiveTab = activeTab;
            activeTab.state = "active";
            activeTab.view.visible = true;
            activeTabHistory.push(activeTab.uid);
        }
    }

    /*!
        Add a tab to the view.
    */
    function addTab(view, background) {
        // Reparent view
        view.parent = viewContainer;

        var modelData = {
            view: view,
            uid: lastTabUID,
            state: "inactive",
            title: view.title,
            closable: view.closable,
            movable: view.movable,
            iconName: view.iconName
        }

        view.uid = lastTabUID;
        view.tabView = tabView;

        tabsModel.append(modelData);
        if (!background)
            setActiveTab(lastTabUID, true);
        lastTabUID++;
        return modelData;
    }

    /*!
        Remove a tab from the view.
    */
    function removeTab(t) {
        // t is uid
        if (typeof(t) === "number") {
            // Remove all uid references from activeTabHistory
            while (activeTabHistory.indexOf(t) > -1) {
                activeTabHistory.splice(activeTabHistory.indexOf(t), 1);
            }
            var modelData;
            // Set last active tab
            if (activeTab.uid === t) {
                setLastActiveTabActive();
                modelData = getTabModelDataByUID(t);
                modelData.view.visible = false;
                //modelData.view.destroy();
                tabsModel.remove(getTabModelIndexByUID(t));
                // Was the last tab closed?
                if (tabsModel.count === 0) {
                    lastTabClosed();
                }
            }
            else {
                modelData = getTabModelDataByUID(t);
                modelData.view.visible = false;
                //modelData.view.destroy();
                tabsModel.remove(getTabModelIndexByUID(t));
            }
        }
    }

    /*!
        Set the active tab.
    */
    function setActiveTab(t, ensureVisible) {
        if (typeof(t) === "number") {
            activeTab = getTabModelDataByUID(t);
        }
        else {
            activeTab = t;
        }
        if (ensureVisible)
            ensureTabIsVisible(t);
    }

    /*!
        Ensure a tab is visible.
    */
    function ensureTabIsVisible(t) {
        if (typeof(t) === "number") {
            var modelIndex = getTabModelIndexByUID(t);
            tabBar.listView.positionViewAtIndex(modelIndex, ListView.Visible);
        }
    }

    /*!
        Set the last active tab active.
    */
    function setLastActiveTabActive () {
        if (tabsModel.count > 1) {
            if (activeTabHistory.length > 0) {
                setActiveTab(activeTabHistory[activeTabHistory.length-1], true);
            } else {
                setActiveTab(getUIDByModelIndex(0), true);
            }
        }
    }

    /*!
        Return the model data based on a tab id. Used internally.
    */
    function getTabModelDataByUID (uid) {
        for (var i=0; i<tabsModel.count; i++) {
            if (tabsModel.get(i).uid == uid) {
                return tabsModel.get(i);
            }
        }
        return false;
    }

    /*!
        Return the model index based on a tab id. Used internally.
    */
    function getTabModelIndexByUID (uid) {
        for (var i=0; i<tabsModel.count; i++) {
            if (tabsModel.get(i).uid == uid) {
                return i;
            }
        }
        return false;
    }

    /*!
        Return the tab id based on the model index. Used internally.
    */
    function getUIDByModelIndex(i) {
        return tabsModel.get(i).uid;
    }

    TabBar {
        id: tabBar

        tabsModel: tabView.tabsModel
        tabView: parent
        menu: tabView.menu
        actions: tabView.actions

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Item {
        id: viewContainer
        anchors {
            top: tabBar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    Component.onCompleted: {
        for (var i=0; i<children.length; i++) {
            var child = children[i];
            if(child.objectName === "TabPage") {
                addTab(child);
            }
        }
    }
}
