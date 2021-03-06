import QtQuick 2.0

Rectangle{
    id: budget_wrapper
    anchors.fill: parent
    color: "transparent"

    property alias back_mouseArea: budget_title.back_btn_mouseArea
    property alias setup_mouseArea: settings_btn.mouseArea
    property alias categories_mouseArea: categories_btn.mouseArea
    property alias add_mouseArea: add_btn.mouseArea
    property double remainingBudget: TheBigBudget.getRemainingBudget()
    property double totalBudget: 0.00
    property bool colorBlind_Checked: false

    property alias newItem: budget_model

    onColorBlind_CheckedChanged: {
        if(colorBlind_Checked){
            budget_title.color =  "#424242";
            add_btn.btnColor = "#757575";
            categories_btn.btnColor = "#757575";
        }
        else{
            budget_title.color = "#1DE9B6";
            add_btn.btnColor = "#FBC02D";
            categories_btn.btnColor = "#FBC02D";
        }
    }

    MyTitleBar{
        id: budget_title
        title: "Budget"
        //back_visible: true
    }

    MyButton{
        id: settings_btn
        height: budget_title.titleHeight
        width: budget_title.titleHeight
        //text: "Settings"
        textColor: budget_title.textColor
        anchors.right: budget_title.right
        anchors.top: budget_title.top
        anchors.verticalCenter: budget_title.verticalCenter
        color: "transparent"
        Image{
            z: 5
            anchors.centerIn: settings_btn
            id: settings_icon
            height: budget_title.titleHeight - 15
            width: height
            source: "/../../img/ic_settings_white_48dp.png"
        }
    }

    Rectangle{
        id: remaining_wrapper
        color: "transparent"
        height: budget_wrapper.height/10
        width: 9.5*budget_wrapper.width/10
        anchors.horizontalCenter: budget_wrapper.horizontalCenter
        anchors.top: budget_title.bottom
        anchors.topMargin: 15
        Text{
            id: remaining_txt
            width: parent.width
            text: "You have $"
                  + remainingBudget
                  + " left of your $"
                  + totalBudget
                  + " budget!";
            color: "black"
            font.pointSize: 14
            font.family: "Raleway"
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap

        }
    }



    MyButton{
        id: add_btn
        height: 90
        width: 90
        radius: 2000
        text: "+"
        fontSize: 36
        textColor: "white"
        anchors.horizontalCenter: budget_wrapper.horizontalCenter
        anchors.bottom: budget_wrapper.bottom
        anchors.bottomMargin: 10

    }

    MyButton{
        id: categories_btn
        height: add_btn.height/2
        width: 100
        anchors.verticalCenter: add_btn.verticalCenter
        text: "Categories"
        textColor: "white"
        fontSize: 11
        anchors.left: add_btn.right
        anchors.leftMargin: 25
    }

    Rectangle{
        id: budget_table
        width: budget_wrapper.width - 20
        anchors.top: remaining_wrapper.bottom
        anchors.topMargin: 15
        anchors.bottom: add_btn.top
        anchors.bottomMargin: 5
        anchors.horizontalCenter: budget_wrapper.horizontalCenter
        color: "transparent"
        border.width: 1
        border.color: "light grey"
        Component.onCompleted: {
            for (var i = 0; i < TheBigBudget.getCount(); i++) {
                budget_model.append({ "date":getDate(i), "purchase":getPurchase(i), "amount":getAmount(i) });
            }
        }

        function getDate(i) {
            return {date: TheBigBudget.getItemDate(i)};
        }
        function getPurchase(i) {
            return {purchase: TheBigBudget.getItemPurchase(i)};
        }
        function getAmount(i) {
            return {amount: TheBigBudget.getItemAmount(i)};
        }


        ListModel{
            id: budget_model
        }
        Component
        {
            id: budget_delegate


            Row
            {
                Rectangle{
                    height: 50
                    width: budget_table.width/3
                    color: TheBigBudget.getCount() % 2  === 0 ? "#F5F5F5" : "#E0E0E0"
                    z: -1
                    Text
                    {
                        text: date
                        color: "black"
                        font.pointSize: 10
                        font.family: "Raleway"
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    height: 50
                    width: budget_table.width/3
                    color: TheBigBudget.getCount() % 2  === 0 ? "#F5F5F5" : "#E0E0E0"
                    z: -1
                    Text
                    {
                        text: purchase
                        color: "black"
                        font.pointSize: 10
                        font.family: "Raleway"
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    height: 50
                    width: budget_table.width/3
                    color: TheBigBudget.getCount() % 2  === 0 ? "#F5F5F5" : "#E0E0E0"
                    z: -1
                    Text
                    {
                        text: amount
                        color: amount < 0 ? "red" : "green"
                        font.pointSize: 10
                        font.family: "Raleway"
                        anchors.centerIn: parent
                    }
                }

            }
        }
        ListView{
            anchors.fill: parent
            model: budget_model
            delegate: budget_delegate
        }
    }
}

