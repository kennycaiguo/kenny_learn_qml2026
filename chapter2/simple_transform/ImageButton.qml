import QtQuick

Image {
    id:root
    width: 120
    height: 30
    signal clicked
    source: "qrc:/heartscene.png"

    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()
    }

}
