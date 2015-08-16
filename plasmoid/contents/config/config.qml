import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
        name: "General"
        icon: "configure"
        source: "GeneralConfig.qml"
    }
    ConfigCategory {
        name: "UI"
        icon: "application-menu"
        source: "UIConfig.qml"
    }
    ConfigCategory {
        name: "Backend"
        icon: "utilities-terminal"
        source: "BackendConfig.qml"
    }
}
