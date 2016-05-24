import QtQuick 2.0
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0
import QtQuick.Controls.Styles 1.2


Rectangle{
    id: settings_root
    anchors.fill: parent
    color: "transparent"
    property alias back_mouseArea: settings_title.back_btn_mouseArea
    property bool colorBlind: false
    property alias colorBlind_Checked: colorblind_switch.checked

    signal settingsSave
    property int enteredBudget: 0

    onColorBlind_CheckedChanged: {
        if(colorBlind_Checked){
            settings_title.color =  "#424242";
            setup_save.btnColor = "#757575";
        }
        else{
            settings_title.color = "#1DE9B6";
            setup_save.btnColor = "#FBC02D";
        }
    }

    Settings{
        id: settings_global
        property alias colors: colorblind_switch.checked
        property alias currency: currency_box.currentIndex

    }

    MyTitleBar{
        id: settings_title
        title: "Settings"
        titleSize: 20
        back_visible: true
    }


    Text{
        id: budget_txt
        text: "What do you want your budget to be?"
        font.pointSize: 11
        font.family: "Raleway"
        anchors.top: settings_title.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField{
        id: budget_tf
        height: 30
        width: 7*(parent.width/10)
        placeholderText: "Enter budget amount"
        anchors.top: budget_txt.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        // Ensure they enter a number that has two decimals and is at least 0.00
        validator: DoubleValidator{
            bottom: 0.00
            notation: "StandardNotation"
            decimals: 2
        }
    }

    MyButton{
        id: setup_save
        text: "Save Changes"
        textColor: "white"
        fontSize: 14
        height: parent.height/10
        width: 9*(parent.width/10)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        mouseArea.onClicked: {
            enteredBudget = budget_tf.text;
            budget_tf.text = "";    //clear the text

            settingsSave();
        }
    }


    Text{
        id: colorblind_txt
        text: "Colorblind mode"
        anchors.horizontalCenterOffset: 1
        font.pointSize: 11
        font.family: "Raleway"
        anchors.top: budget_tf.bottom
        anchors.topMargin: 15
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Switch{
        id: colorblind_switch
        anchors.top: colorblind_txt.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        checked: colorBlind
    }

    Text{
        id: currency_txt
        text: "Currency"
        font.pointSize: 11
        font.family: "Raleway"
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
        width: parent.width/5
        anchors.top: currency_txt.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

}



