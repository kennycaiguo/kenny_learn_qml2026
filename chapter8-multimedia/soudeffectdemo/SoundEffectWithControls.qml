import QtQuick
import QtQuick.Controls
import QtMultimedia


Rectangle {
     id:root
     width: 500;height: 450
     SoundEffect { id: beep; source: "qrc:/beep.wav"}
     SoundEffect { id: swosh; source: "qrc:/swosh.wav" }

     Rectangle{
         id:rect
         anchors.centerIn: parent
         width: 300;height: width
         color: "steelblue"
         state: "default"

         states: [
             State {
                 name: "default"
                 PropertyChanges {
                     target: rect
                     rotation: 0
                 }
             },
             State {
                 name: "reverse"
                 PropertyChanges {
                     target: rect
                     rotation:180
                 }
             }
         ]

         transitions: [
             Transition {
                 to: "default"
                 ParallelAnimation{
                     ScriptAction{script: swosh.play()}
                     PropertyAnimation{
                         properties: "rotation"
                         duration: 200
                     }
                 }
             },
             Transition {
                 to: "reverse"
                 ParallelAnimation{
                     ScriptAction{script: beep.play()}
                     PropertyAnimation{
                         properties: "rotation"
                         duration: 200
                     }
                 }
             }
         ]
     }

     Button{
         id:play
         text: "Flip"
         x:10;y:10
         width: 70;height: 25
         onClicked: {
             rect.state = rect.state === "default"? "reverse" : "default"
         }
     }
}
