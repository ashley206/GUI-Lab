import QtQuick 2.0
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0

Rectangle{
    id: add_item_wrapper
    anchors.fill: parent
    color: "transparent"
    property alias back_mouseArea: add_category_title.back_btn_mouseArea

    MyTitleBar{
        id: add_category_title
        title: "Add Category"
        back_visible: true
    }
}
