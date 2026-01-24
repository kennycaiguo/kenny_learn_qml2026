import QtQuick
import QtMultimedia

Item {
   id:root

   SoundEffect{
       id:sound
       // source: "https://kennycaiguo.github.io/kenny-test-qmlsite/beep.wav" //网络音效没有问题
       source:"qrc://beep.wav" //需要在CMakeLists.txt中设置： set(CMAKE_AUTORCC ON)
   }

   Rectangle{
       id:btn
       width: 200
       height: 100
       color:"#ccc"

       Text {
           id: name
           text: qsTr("play")
           anchors.centerIn: parent
       }
       MouseArea {
          anchors.fill: parent
          onClicked: sound.play()
      }
   }
}
