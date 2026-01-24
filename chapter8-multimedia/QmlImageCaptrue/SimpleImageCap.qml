import QtQuick
import QtMultimedia

Item {
    id:root
    width:parent.width
    height:parent.height

    Row{
        x:20;y:10
        spacing: 20
        Rectangle{
            id:prevRect
            width: 70;height:70
            anchors.margins: 3
            border.color: "#ccc"
            Image {
                id: photoPreview
                anchors.fill: parent
                source: imageCapture.preview // always shows the last captured image
            }
        }
        Text {
            id: label
            text: qsTr("图片保存路径:")
            font.pixelSize: 20
            anchors.verticalCenter: prevRect.verticalCenter
        }
        Rectangle{
            id:pathRect
            border.color: "green"
            width: 300;height: 30
            anchors.verticalCenter: prevRect.verticalCenter
            TextInput{
                id:input
                focus:true
                text: "D:/ImageCap/"
                font.pixelSize: 20
                anchors.leftMargin: 8
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    Rectangle{
        id:capRect
        border.color: "orange"
        width:root.width-30 ;height:root.height-200
        anchors.centerIn: parent
        CaptureSession {
            id:cap
            imageCapture : ImageCapture {
                id: imageCapture
            }
            camera: Camera {
                id: camera
            }

            videoOutput: videoOutput
        }
        VideoOutput {
            id: videoOutput
            anchors.fill: parent

            MouseArea {
                anchors.fill: parent;
                onClicked:{
                    imageCapture.capture();
                    var path = "file:///"+input.text+getCurrentTime()+".png"
                    // imageCapture.saveToFile("file:///D:/ImageCap/guo.png") //保存截图
                    // // imageCapture.saveToFile("file:D:\\ImageCap\\ken.png") //保存截图
                    // imageCapture.saveToFile("file:kenny.png") //保存截图,保存在debug文件夹里面
                    // imageCapture.captureToFile("file:D:\\ImageCap\\guo.png") //这个api没有用
                     imageCapture.saveToFile(path) //保存截图
                    console.log(input.text)
                    getCurrentTime()
                }
            }
        }
    }


    Rectangle{
        id:listRect
        anchors.top: capRect.bottom
        anchors.topMargin: 10
        width: capRect.width
        anchors.horizontalCenter: parent.horizontalCenter
        height: 80
        border.color: "deeppink"
    }

    Component.onCompleted: cap.camera.start()

    function getCurrentTime(){
        var time = Qt.formatDateTime(new Date(),"yyyyMMdd_hh_mm_ss_zzz")
        console.log(time)
        return time
    }
}
