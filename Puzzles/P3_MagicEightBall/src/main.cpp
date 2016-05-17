#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "magic_8_ball.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    magic_8_ball m8ball;
    engine.rootContext()->setContextProperty("Cursed_8_ball", &m8ball);

    // Call main.qml
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
