import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // ImageButton{
    //     id:btn
    //     onClicked: console.log("clicked...")
    // }

    SimpleTransformDemo{
        anchors.fill: parent
    }
}
