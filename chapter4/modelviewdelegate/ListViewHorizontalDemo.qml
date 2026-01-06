import QtQuick

Rectangle {
    id:root
    width: 300
    height:80
    color: "wheat"

    Component{
        id:numberDelegate
        Rectangle{
            width: 40
            height: 40
            color: "lightgreen"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }
    ListView{
        model:100
        delegate: numberDelegate
        clip: true
        anchors.fill: parent
        //关闭列表视图的元素排列方式为水平方向,默认是垂直方向
        orientation: ListView.Horizontal
        //还可以修改替代展示方式
        layoutDirection: Qt.RightToLeft // 默认是Qt.LeftToRight
        spacing: 5
        anchors.margins: 20
    }
}
