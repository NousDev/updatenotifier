import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.2
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: generalPage

    width: childrenRect.width
    height: childrenRect.height

    property alias cfg_refreshInterval: refreshIntervalInput.value
    property alias cfg_openSoftwareCenterCommand: openSoftwareCenterCommandInput.text
    property alias cfg_refreshListCommand: refreshListCommandInput.text
    property alias cfg_updateSystemCommand: updateSystemCommandInput.text
    property alias cfg_notifyCommand: notifyCommandInput.text

    GridLayout {

        columns:2

        anchors.left:parent.left
        anchors.right:parent.right


        Label{
            text:"Refresh interval:"
        }

        SpinBox {
            id: refreshIntervalInput

            suffix: "min"
            minimumValue: 1
            maximumValue: 120

            Layout.fillWidth:true
        }

        Label{
            text:" "
        }

        Label{

        }

        Label{
            text:"Open software center command:"
        }

        TextField{
            id: openSoftwareCenterCommandInput

            Layout.fillWidth:true
        }


        Label{
            text:"Refresh list command:"
        }

        TextField{
            id: refreshListCommandInput

            Layout.fillWidth:true
        }


        Label{
            text:"Update system command:"
        }

        TextField{
            id: updateSystemCommandInput

            Layout.fillWidth:true
        }


        Label{
            text:"Notify command:"
        }

        TextField{
            id: notifyCommandInput

            Layout.fillWidth:true
        }
    }
}
