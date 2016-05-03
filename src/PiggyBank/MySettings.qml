import QtQuick 2.0
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0



Rectangle{
    id: settings_root
    anchors.fill: parent
    color: "white"
    property alias back_mouseArea: back_btn.mouseArea


    Settings{
        id: settings_global
        property alias colorblind: colorblind_switch.checked
        property alias currency: currency_box.currentIndex
    }

    MyTitleBar{
        id: settings_title
        title: "Settings"
        titleSize: 0
        titleHeight: parent.width/8
    }

    MyButton{
        id: back_btn
        // eventually want an image here
        text: "Back"
        anchors.top: parent.top
        anchors.left: parent.left
        width: settings_title.titleHeight
        height: settings_title.titleHeight
        color: settings_title.color
    }

    Text{
        id: colorblind_txt
        text: "Colorblind mode"
        font.pointSize: 11
        anchors.top: settings_title.bottom
        anchors.topMargin: 15
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Switch{
        id: colorblind_switch
        anchors.top: colorblind_txt.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        checked: false
    }

    Text{
        id: currency_txt
        text: "Currency"
        font.pointSize: 11
        anchors.top: colorblind_switch.bottom
        anchors.topMargin: 15
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    ComboBox{
        id: currency_box
        editable: false
        model: ListModel{
            id: currency_model
            ListElement{ text: "USD"; }
            ListElement{ text: "GBP"; }
            ListElement{ text: "EUR"; }
        }
        // On accepted, change setting?
        width: 2*(parent.width/3)
        anchors.top: currency_txt.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

}



