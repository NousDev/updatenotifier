import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.2
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: root

    width: childrenRect.width
    height: childrenRect.height

    property alias cfg_refreshInterval: refreshIntervalInput.value

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
    }
}
