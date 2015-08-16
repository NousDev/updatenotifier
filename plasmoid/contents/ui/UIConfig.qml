import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.2
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: generalPage

    width: childrenRect.width
    height: childrenRect.height

    property alias cfg_refreshListIcon: refreshListIconInput.text
    property alias cfg_updateSystemIcon: updateSystemIconInput.text
    property alias cfg_openSoftwareCenterIcon: openSoftwareCenterIconInput.text
    property alias cfg_notifyUpdatesAvailableIcon: notifyUpdatesAvailableIconInput.text

    GridLayout {

        columns:2

        anchors.left:parent.left
        anchors.right:parent.right

        Label{
            text:"Refresh icon:"
        }

        TextField{
            id: refreshListIconInput

            Layout.fillWidth:true
        }


        Label{
            text:"Update icon:"
        }

        TextField{
            id: updateSystemIconInput

            Layout.fillWidth:true
        }


        Label{
            text:"Open software center icon:"
        }

        TextField{
            id: openSoftwareCenterIconInput

            Layout.fillWidth:true
        }


        Label{
            text:"Notify icon:"
        }

        TextField{
            id: notifyUpdatesAvailableIconInput

            Layout.fillWidth:true
        }
    }
}
