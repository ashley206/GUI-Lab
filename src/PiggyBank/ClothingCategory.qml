import QtQuick 2.0

Rectangle{
    id: category_wrapper
    anchors.fill: parent
    color: "transparent"

    property alias back_mouseArea: clothing_categories_title.back_btn_mouseArea
    property alias newClothingItem: categories_clothing_model

    MyTitleBar{
        id: clothing_categories_title
        title: "Clothing"
        back_visible: true
    }


    Rectangle{
        id: clothing_category_table
        width: 9*category_wrapper.width/10
        anchors.top: clothing_categories_title.bottom
        anchors.topMargin: 20
        anchors.bottom: category_wrapper.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: category_wrapper.horizontalCenter
        color: "transparent"
        border.width: 1
        border.color: "light grey"
        Component.onCompleted: {
            for (var i = 0; i < TheBigBudget.getCount(); i++) {
                if(TheBigBudget.getItemCategory(i) === "Clothing")
                    categories_clothing_model.append({ "date":getDate(i), "purchase":getPurchase(i), "amount":getAmount(i) });
            }
        }

        ListModel{
            id: categories_clothing_model
        }

        Component
        {
            id: categories_delegate
            Row
            {
                Rectangle{
                    height: 50
                    width: clothing_category_table.width/3
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
                    width: clothing_category_table.width/3
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
                    width: clothing_category_table.width/3
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
            id: categories_clothing_view
            anchors.fill: parent
            model: categories_clothing_model
            delegate: categories_delegate
        }
    }

    function getDate(i) {
        var food = TheBigBudget.getItemDate(i);
        return {date: food};
    }
    function getPurchase(i) {
        var purchase = TheBigBudget.getItemPurchase(i);
        return {purchase: purchase};
    }
    function getAmount(i) {
        var amount = TheBigBudget.getItemAmount(i);
        return {amount: amount};
    }
}
