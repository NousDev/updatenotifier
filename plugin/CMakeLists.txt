add_definitions(-DTRANSLATION_DOMAIN="plasma_applet_org.kde.plasma.updatenotifier")
option (USE_QT5 "Use Qt5 instead of Qt4" ON)

find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS Network)

set(updatenotifierplugin_SRCS
    updatenotifierplugin.cpp
)

install(FILES qmldir DESTINATION ${QML_INSTALL_DIR}/org/kde/plasma/private/updatenotifier)
add_library(updatenotifierplugin SHARED ${updatenotifierplugin_SRCS})

target_link_libraries(updatenotifierplugin
                        Qt5::Quick
                        )

install(TARGETS updatenotifierplugin DESTINATION ${QML_INSTALL_DIR}/org/kde/plasma/private/updatenotifier)
