import QtQuick

Window {
    width: 640
    height: 640
    visible: true
    title: qsTr("Hello World")

    // FileDialogDemo{
    //     anchors.centerIn: parent
    // }

    // FolderDialogDemo{
    //     anchors.centerIn: parent
    // }

    Rectangle{
        width: 640
        height: 640
        CapToListView{
           anchors.horizontalCenter: parent.horizontalCenter

        }
    }


}
