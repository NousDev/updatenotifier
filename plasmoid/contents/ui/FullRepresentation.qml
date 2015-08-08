import QtQuick 2.0
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0

Item {

    focus: true

    Item {
        id: toolbar

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height:units.iconSizes.large

        PlasmaExtras.Heading {
            id: lblStatus

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: btnGroup.left

            level: 3
            opacity: 0.6
            text: root.statusText
        }

        Item {
            id:btnGroup

            anchors.fill:parent

            PlasmaComponents.ToolButton {
                id: btnUpdate

                anchors.right: btnRefresh.left
                anchors.top: parent.top

                height: units.iconSizes.large

                opacity: root.availableUpdates.length ? 1 : 0

                iconSource: plasmoid.configuration.updateSystemIcon
                tooltip: i18n("Update system...")

                onClicked: root.action_updateSystem()
            }

            PlasmaComponents.ToolButton {
                id: btnRefresh

                anchors.right: btnSettings.left
                anchors.top: parent.top

                height: units.iconSizes.large

                iconSource: plasmoid.configuration.refreshListIcon
                tooltip: i18n("Refresh list...")

                onClicked:root.action_refreshList()
            }

            PlasmaComponents.ToolButton {
                id: btnSettings

                anchors.right: parent.right
                anchors.top: parent.top

                height: units.iconSizes.large

                iconSource: plasmoid.configuration.openSoftwareCenterIcon
                tooltip: i18n("Open software center...")

                onClicked: root.action_openSoftwareCenter()
            }
        }
    }

    Item {
        id: content

        anchors.top: toolbar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        PlasmaExtras.ScrollArea {
            anchors.fill: parent

            opacity: root.availableUpdates.length ? 1 : 0

            ListView {
                id: list

                focus: true
                boundsBehavior: Flickable.StopAtBounds

                model: root.availableUpdates

                delegate: PlasmaComponents.ListItem {

                    Row{
                        id:rowMain

                        anchors.left:parent.left
                        spacing:10

                        PlasmaComponents.Label {
                            id:lblTitle

                            elide: Text.ElideRight
                            text: root.availableUpdates[index][0]
                            font.pointSize : 14
                        }

                        PlasmaComponents.Label {
                            id:lblVersion

                            elide: Text.ElideRight
                            text: root.availableUpdates[index][1]
                            font.pointSize : 12
                            opacity: 0.8
                        }
                    }

                    PlasmaComponents.Label {
                        id:lblDescription

                        anchors.left:rowMain.right
                        anchors.right:parent.right
                        anchors.leftMargin:20

                        elide: Text.ElideRight
                        wrapMode:Text.Wrap
                        maximumLineCount:2
                        horizontalAlignment:Text.AlignRight
                        verticalAlignment:Text.AlignVCenter
                        text: root.availableUpdates[index][2]
                        font.pointSize : 10
                        opacity: 0.6
                    }
                }
            }
        }
    }
}
