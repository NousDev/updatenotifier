#ifndef UPDATENOTIFIERPLUGIN_H
#define UPDATENOTIFIERPLUGIN_H

#include <QQmlExtensionPlugin>
#include <QProcess>
#include <QJSEngine>
#include <QJSValue>

class Process : public QObject
{
    Q_OBJECT
public:

    QMap<QProcess*, QJSValue>      _Processes;

    Q_INVOKABLE void executeCommand(const QString & cmd, QJSValue callback)
    {
        QProcess * process = new QProcess();
        _Processes[process] = callback;
        QObject::connect(process, SIGNAL(finished(int , QProcess::ExitStatus)), this, SLOT(onFinishedProcess(int , QProcess::ExitStatus)));
        process->start(cmd);
    };

public slots:
    void onFinishedProcess(int exitCode, QProcess::ExitStatus exitStatus)
    {
        QProcess * sender = (QProcess*)QObject::sender();
        QJSValue callback = _Processes[sender];
        QJSValue jsValue = callback.engine()->newObject();

        jsValue.setProperty("data", QString(sender->readAllStandardOutput()));
        callback.call(QJSValueList { jsValue });

        _Processes.remove(sender);
        sender.deleteLater();
    };
};

class UpdateNotifierPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")
public:
    virtual void registerTypes(const char *uri);
};

#endif // UPDATENOTIFIERPLUGIN_H
