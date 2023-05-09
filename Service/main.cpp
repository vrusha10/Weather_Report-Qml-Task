#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ServiceDetails/serviceInformation.h"
//#include "ServiceDetails/serviceInterface.h"*/

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    serviceInformation data;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("testing", &data);

    data.startTimer();
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
