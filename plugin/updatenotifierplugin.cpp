#include "updatenotifierplugin.h"

#include <QtQml>

void UpdateNotifierPlugin::registerTypes (const char *uri)
{
    Q_ASSERT(uri == QLatin1String("org.kde.plasma.private.updatenotifier"));
    qmlRegisterType<Process>(uri, 0, 1, "Process");
}
