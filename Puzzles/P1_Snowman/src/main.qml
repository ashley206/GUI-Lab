import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    height: 480
    width: 640

    Image{
        anchors.fill: parent
        source:"../img/Background.png"
    }

    // Create instances of "SnowMan" here...

    Rectangle{
        id: top
        z:3
        width: 1.5*parent.width/10
        height: 1.5*parent.width/10
        radius: 1.5*parent.width/10
        border.color: "grey"
        border.width: 1
        anchors.bottom: mid.top
        anchors.horizontalCenter: mid.horizontalCenter
        anchors.bottomMargin: -15
    }

    Rectangle{
        id: mid
        z:2
        width: 2*parent.width/10
        height:2*parent.width/10
        radius: 2*parent.width/10
        border.color: "grey"
        border.width: 1
        anchors.bottom: bottom.top
        anchors.horizontalCenter: bottom.horizontalCenter
        anchors.bottomMargin: -20
    }

    Rectangle{
        id: bottom
        z:1
        width: 3*parent.width/10
        height: 3*parent.width/10
        radius: 3*parent.width/10
        border.color: "grey"
        border.width: 1
        anchors.bottom: parent.bottom
    }

    Rectangle{
        id: l_eye
        z:4
        width: 10
        height: 10
        radius: 5
        color: "black"
        anchors.horizontalCenter: top.horizontalCenter
        anchors.verticalCenter: top.verticalCenter
        anchors.horizontalCenterOffset: 20
    }
    Rectangle{
        id: r_eye
        z:4
        width: 10
        height: 10
        radius: 5
        color: "black"
        anchors.horizontalCenter: top.horizontalCenter
        anchors.verticalCenter: top.verticalCenter
        anchors.horizontalCenterOffset: -20
    }
    Image{
        id: carrot
        z:4
        fillMode: Image.PreserveAspectFit
        source: "../img/carrot.png"
        width: 50
        height: 50
        anchors.horizontalCenter: top.horizontalCenter
        anchors.horizontalCenterOffset: -5
        anchors.bottom: top.bottom
    }

    Image{
        id: hat
        z: 4
        fillMode: Image.PreserveAspectFit
        source: "../img/hat.png"
        width: 100
        height: 100
        anchors.horizontalCenter: top.horizontalCenter
        anchors.horizontalCenterOffset: -10
        anchors.bottom: top.top
        anchors.bottomMargin: -25
    }
}

