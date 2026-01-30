import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    id:root
    width: 500;height: 400
    Row{
       id:controls
       y:10
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
           text: "Choose path"
           onClicked: {
             dlg.open() //我们需要选择文件夹来保存我们的截图
           }
       }

    }


    FolderDialog{
         id:dlg
         onAccepted: {
            input.text = dlg.selectedFolder
         }
         onRejected: console.log("user clicked cancel。。。")
    }

    FileDialog{
        id:fdlg
        onAccepted:{
            pic.source =  fdlg.selectedFile
        }

        onRejected: console.log("user clicked cancel。。。")
    }

    Column{
        spacing: 5
        anchors.top: controls.bottom
        anchors.topMargin: 15
        Button{
            id:open
            text: "Open Image..."
            onClicked: fdlg.open()
        }

        Rectangle{
            id:rect
            width: 300;height: 300
            // color: "deeppink"
            Image{
                id:pic
                source: ""
                anchors.fill: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    pic.grabToImage(function(result) {
                        // 3. 将结果保存为文件
                        var fileName = input.text + "/"+getTimeString()+".png"
                        if (result.saveToFile(fileName)) {
                            console.log("图片已保存");
                        } else {
                            console.error("保存失败");
                        }

                    })
                }
            }
        }


    }
    function getTimeString(){
        return Qt.formatDateTime(new Date(), "yyyy-MM-dd-hh_mm_ss")
    }

}
