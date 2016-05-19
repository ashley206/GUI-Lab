import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtMultimedia 5.6
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Poor Man's Snapchat")

    property int xpos
    property int ypos
    property bool canPaint : false;
    property bool canText : false;
    property alias textColor: ti_textArea.color

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent




        Camera
        {
            id: my_camera

        }

        VideoOutput
        {
            anchors.fill: parent
            source: my_camera
        }
        Image
        {
            id: img_crayon
            source: "../../img/crayon.png"
            height: 50
            width: 50
            opacity: 1
            anchors.right: big_wrapper.right
            anchors.rightMargin: 20
            z: 4

            MouseArea
            {
                id: ma_mousearea_crayon
                anchors.fill: parent

                onPressed:
                {
                    img_crayon.opacity = 0.2
                }

                onReleased:
                {
                    img_crayon.opacity = 1
                }
                onClicked:
                {
                    picker.visible = true;
                }

                preventStealing: false
            }
        }

        Image
        {
            id: img_text
            source: "../../img/text.png"
            height: 50
            width: 50
            opacity: 1
            anchors.right: img_crayon.left
            anchors.rightMargin: 20
            z: 4

            MouseArea
            {
                id: ma_mousearea_text
                anchors.fill: parent

                onPressed:
                {
                    img_text.opacity = 0.2
                }

                onReleased:
                {
                    img_text.opacity = 1
                }
                onClicked:
                {
                    canText = true;
                    canPaint = false;
                    ti_textArea.visible = true;
                }

                preventStealing: false
            }
        }

        Image
        {
            id: img_pen
            source: "../../img/pen.png"
            height: 50
            width: 50
            opacity: 1
            anchors.right: img_text.left
            anchors.rightMargin: 20
            z: 4

            MouseArea
            {
                id: ma_mousearea_pen
                anchors.fill: parent

                onPressed:
                {
                    img_pen.opacity = 0.2
                }

                onReleased:
                {
                    img_pen.opacity = 1
                }
                onClicked:
                {
                    canPaint = true;
                    canText = false;

                }

                preventStealing: false
            }
        }

        Canvas
        {
            id: canvas_canvas
            anchors.fill: parent

            z: 3

            onPaint:
            {
                if(canPaint){
                var painter = getContext("2d");

                painter.fillStyle = "green";
                painter.lineCap = "round";
                painter.fillRect(xpos-1, ypos-1, 25, 25);
                }
            }

            MouseArea{
                anchors.fill: parent
                onPressed: {
                    xpos = mouseX
                    ypos = mouseY
                    canvas_canvas.requestPaint()
                }
                onMouseXChanged: {
                    xpos = mouseX
                    ypos = mouseY
                    canvas_canvas.requestPaint()
                }
                onMouseYChanged: {
                    xpos = mouseX
                    ypos = mouseY
                    canvas_canvas.requestPaint()
                }
                preventStealing: true
            }
        }

        Image
        {
            id: img_camera
            source: "../../img/camera.png"
            height: 50
            width: 50
            opacity: 1

            z:5

            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.bottom: big_wrapper.bottom
            anchors.bottomMargin: 60

            MouseArea
            {
                id: ma_mousearea
                anchors.fill: parent

                onPressed:
                {
                    img_camera.opacity = 0.2
                }

                onReleased:
                {
                    img_camera.opacity = 1
                }
                onClicked:
                {
                    se_shutter_camera.play();
                    my_camera.imageCapture.captureToLocation("Qt_selfie");
                }

                preventStealing: false
            }
        }

        Text
        {
            id: txt_center

            z:5

            color: textColor
            font.family: "Arial"
            font.pixelSize: 48
            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.verticalCenter: big_wrapper.verticalCenter
        }

        TextInput
        {
            id: ti_textArea
            visible: false;

            z:5

            font.family: "Arial"
            font.pixelSize: 48
            color: "black"
            focus: true
            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.verticalCenter: big_wrapper.verticalCenter

            Keys.onReturnPressed:
            {
                txt_center.text = ti_textArea.text;
                console.log(ti_textArea.text);
                focus = false;
                ti_textArea.visible = false;
                ti_textArea.text = "";
            }
        }

        Audio
        {
            id: se_shutter_camera
            source: "../../sound_effects/shutter_camera.mp3"
        }
    }

}
