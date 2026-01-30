import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    y:20
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
               text: "file:///D:/test_medias"
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
        id:ctrl2
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
            width: 450;height: 400
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
                            // imgPath.append({"path":fileName})
                            imgPath.insert(0,{"path":fileName})
                        } else {
                            console.error("保存失败");
                        }

                    })
                }
            }
        }


    }

    Item{
        id:view
        width: parent.width
        height: 120
        anchors.top: ctrl2.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 20


        ListModel{
            id: imgPath
            ListElement{
                path:""
            }
        }

        ListView{
            x:0
            spacing: 8
            anchors.fill: parent
            width: 450
            height: 100
            orientation: ListView.Horizontal
            model: imgPath
            delegate: imgDelegate
        }
        Component{
            id:imgDelegate
            Image {
                id: img
                width: 90;height: 90
                source: path
            }
        }
    }


    function getTimeString(){
        return Qt.formatDateTime(new Date(), "yyyy-MM-dd-hh_mm_ss")
    }

}

