TEMPLATE = app

QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    User.cpp \
    Item.cpp \
    category.cpp \
    categories.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    ../../gui project logo.png \
    ../../img/logo.png

HEADERS += \
    User.h \
    Item.h \
    Budget.h \
    category.h \
    categories.h
