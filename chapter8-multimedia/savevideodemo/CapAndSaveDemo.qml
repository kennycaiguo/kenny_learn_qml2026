import QtQuick
import QtQuick.Controls
import QtMultimedia

/**

这个是一个非常简单的视频采集程序，我们只实现了基本的视频预览和视频保存功能，以后可以继续完善，比如使用对话框来选择保存路径等等
*/

Rectangle {
    id: root
    width: 500;height: 500
    y:20
    anchors.topMargin: 20
    anchors.horizontalCenter: parent.horizontalCenter

    Rectangle{
        id:video
        width: 400;height: 350
        anchors.topMargin: 20
        border.color: "steelblue"
        anchors.horizontalCenter: parent.horizontalCenter
        CaptureSession{
            id:cap
            camera: Camera{}
            audioInput: AudioInput{}
            videoOutput: output
            recorder: recorder
        }

        VideoOutput{
            id:output
            anchors.fill: parent
        }

        MediaRecorder{
            id:recorder
           outputLocation: "file:///d:/video/video1.mp4" // 替换为实际路径,并且路径需要存在，否则没有文件生成
           videoFrameRate: 30.0
           quality: MediaRecorder.VeryHighQuality
           onRecorderStateChanged: {
               (state) => {
                   if (state === MediaRecorder.RecordingState) {
                       console.log("正在录制...")
                   } else if (state === MediaRecorder.StoppedState) {
                       console.log("停止录制")
                   }
               }
           }
        }
    }

    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: video.bottom
        anchors.topMargin: 50
        spacing: 20
        Button{
            id:btn1
            width: 200;height: 30
            text: "start"
            onClicked: {
                cap.camera.start()
                recorder.record()
            }
        }

        Button{
            id:btn2
            width: 200;height: 30
            text: "stop"
            onClicked: {
                cap.camera.stop()
                recorder.stop()
            }
        }
    }
}
