import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    id:root
    width: 500;height: 400
    Row{
       id:controls
       y:30
       spacing: 20
       Text {
           id: name
           text: qsTr("Path:")
       }

       Rectangle{
           id:path
           border.color: "orange"
           property alias input:input
           property string text: input.text
           width: 400;height: 30

           TextInput{
               id:input
               text: ""
               anchors.fill: parent
               anchors.margins: 5
               focus: true
           }
       }

       Button{
           id:btn
           text: "Choose..."
           onClicked: {
             // dlg.open()
             fdlg.open()
           }
       }

    }


    // FolderDialog{
    //      id:dlg
    //      onAccepted: {
    //         input.text = dlg.selectedFolder
    //      }
    //      onRejected: console.log("user clicked cancel。。。")
    // }

    FileDialog{
        id:fdlg
        onAccepted:{
            input.text = fdlg.selectedFile
            pic.source = input.text
        }

        onRejected: console.log("user clicked cancel。。。")
    }

    Image{
        id:pic
        anchors.top: controls.bottom
        anchors.topMargin: 10
        anchors.leftMargin: 20
        source: ""
        width: 500;height: 400
    }
}
