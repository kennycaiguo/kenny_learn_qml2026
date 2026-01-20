import QtQuick

Item {

    Image {
                   id: pic5
                   source: "qrc:/assets/bug.jpg"
                   sourceSize: Qt.size(parent.width, parent.height)
                   smooth: true
                   visible: false
               }

               Rectangle {
                   id: displacement
                   color: Qt.rgba(0.5, 0.5, 1.0, 1.0)
                   anchors.fill: parent
                   visible: false
                   Image {
                       anchors.centerIn: parent
                       source: "qrc:/assets/glass_normal.png"
                       sourceSize: Qt.size(parent.width/2, parent.height/2)
                       smooth: true
                   }
               }

               Displace {
                   anchors.fill: pic5
                   source: pic5
                   displacementSource: displacement
                   displacement: 0.1
               }

}
