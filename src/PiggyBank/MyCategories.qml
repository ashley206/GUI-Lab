import QtQuick 2.0

Rectangle{
    id: categories_wrapper
    anchors.fill: parent
    color: "transparent"

    property alias back_mouseArea: categories_title.back_btn_mouseArea
    property alias newRentItem: categories_model

    MyTitleBar{
        id: categories_title
        title: "My Categories"
        back_visible: true
    }

    Rectangle{
        id: food_header
        height: 50
        width: categories_wrapper.width - 20
        color: "#A7FFEB"
        anchors.top: categories_title.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        z: -1
        Text{
            text: "Rent"
            color: "black"
            font.pointSize: 10
            anchors.centerIn: parent
        }
    }
    Rectangle{
        id: food_cat_table
        width: food_header.width
        anchors.top: food_header.bottom
        anchors.bottom: categories_wrapper.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: categories_wrapper.horizontalCenter
        color: "transparent"
        border.width: 1
        border.color: "light grey"
        Component.onCompleted: {
            for (var i = 0; i < TheBigBudget.getCount(); i++) {
                categories_model.append({ "date":getDate(i), "purchase":getPurchase(i), "amount":getAmount(i) });
            }
        }

        function getDate(i) {
            var food;
            if(TheBigBudget.getItemCategory(i) === "Rent")
                food = TheBigBudget.getItemDate(i);
            return {date: food};
        }
        function getPurchase(i) {
            var purchase;
            if(TheBigBudget.getItemCategory(i) === "Rent")
                purchase = TheBigBudget.getItemPurchase(i);
            return {purchase: purchase};
        }
        function getAmount(i) {
            var amount;
            if(TheBigBudget.getItemCategory(i) === "Rent")
                 amount = TheBigBudget.getItemAmount(i);
            return {amount: amount};
        }


        ListModel{
            id: categories_model
        }
        Component
        {
            id: categories_delegate
            Row
            {
                Rectangle{
                    height: 50
                    width: food_cat_table.width/3
                    color: TheBigBudget.getCount() % 2  === 0 ? "#F5F5F5" : "#E0E0E0"
                    z: -1
                    Text
                    {
                        text: date
                        color: "black"
                        font.pointSize: 10
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    height: 50
                    width: food_cat_table.width/3
                    color: TheBigBudget.getCount() % 2  === 0 ? "#F5F5F5" : "#E0E0E0"
                    z: -1
                    Text
                    {
                        text: purchase
                        color: "black"
                        font.pointSize: 10
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    height: 50
                    width: food_cat_table.width/3
                    color: TheBigBudget.getCount() % 2  === 0 ? "#F5F5F5" : "#E0E0E0"
                    z: -1
                    Text
                    {
                        text: amount
                        color: amount < 0 ? "red" : "green"
                        font.pointSize: 10
                        anchors.centerIn: parent
                    }
                }
            }
        }
        ListView{
            anchors.fill: parent
            model: categories_model
            delegate: categories_delegate
        }
    }
}
