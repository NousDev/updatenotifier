import QtQuick 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.private.updatenotifier 0.1

Item {
    id: root

    property variant availableUpdates: []
    property string statusText: ""

    Plasmoid.compactRepresentation: CompactRepresentation {}
    Plasmoid.fullRepresentation: FullRepresentation {}
    Plasmoid.switchWidth: units.gridUnit * 8
    Plasmoid.switchHeight: units.gridUnit * 8

    onAvailableUpdatesChanged: {
        plasmoid.removeAction("separator0")
        plasmoid.removeAction("updateSystem")

        if(root.availableUpdates.length){
            if(root.availableUpdates.length === 1){
                root.statusText = "1 Update available!";
            }
            else{
                root.statusText = root.availableUpdates.length + " Updates available!";
            }

            plasmoid.setAction("updateSystem", "Update system...", plasmoid.configuration.updateSystemIcon)

            sendNotification(root.statusText, plasmoid.configuration.notifyUpdatesAvailableIcon);
        }
        else{
            root.statusText = "Up to date";
        }

        plasmoid.setActionSeparator("separator0")

        plasmoid.status = root.availableUpdates.length ? PlasmaCore.Types.ActiveStatus : PlasmaCore.Types.PassiveStatus;
        plasmoid.toolTipSubText = root.statusText;
    }

    Component.onCompleted: {
        action_refreshList();

        plasmoid.setAction("openSoftwareCenter", "Open software center...", plasmoid.configuration.openSoftwareCenterIcon)
        plasmoid.setAction("refreshList", "Refresh list...", plasmoid.configuration.refreshListIcon)

        plasmoid.setActionSeparator("separator0")
    }

    Timer {
        interval: 60000 * plasmoid.configuration.refreshInterval;
        running: true;
        repeat: true

        onTriggered:{
            action_refreshList();
        }
    }

    Process {
        id:process
    }

    function sendNotification(text, icon){
        var cmd = plasmoid.configuration.notifyCommand;
        cmd = cmd.replace("{{TEXT}}", text);
        cmd = cmd.replace("{{ICON}}", icon);
        process.executeCommand(cmd, function(){

        });
    }

    function action_updateSystem(){
        plasmoid.busy = true;

        try{
          process.executeCommand(plasmoid.configuration.updateSystemCommand, function(){
              action_refreshList();
              plasmoid.busy = false;
          });
        }
        catch(e){
          plasmoid.busy = false;
        }
    }

    function action_refreshList(){
        plasmoid.busy = true;

        try{
          process.executeCommand(plasmoid.configuration.refreshListCommand, function(result){
              var list = [];
              var rows = result.data.split("\n").filter(function(n){ return n != "" });
              for(var i = 0; i < rows.length; i++)
              {
                  list.push(rows[i].split(";"));
              }

              availableUpdates = list;

              plasmoid.busy = false;
          });
        }
        catch(e){
            plasmoid.busy = false;
        }
    }

    function action_openSoftwareCenter(){
        process.executeCommand(plasmoid.configuration.openSoftwareCenterCommand, function(){

        });
    }
}
