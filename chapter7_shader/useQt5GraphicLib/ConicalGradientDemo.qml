import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Image{
        id:pic
        source: "qrc:/assets/butterfly.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    ConicalGradient {
        anchors.fill: pic
        source: pic
        angle: 90.0
        horizontalOffset:20
        verticalOffset:15
        gradient: Gradient {
            GradientStop {
                  position: 0.000
                  color: Qt.rgba(1, 0, 0, 1)
               }
               GradientStop {
                  position: 0.167
                  color: Qt.rgba(1, 1, 0, 1)
               }
               GradientStop {
                  position: 0.333
                  color: Qt.rgba(0, 1, 0, 1)
               }
               GradientStop {
                  position: 0.500
                  color: Qt.rgba(0, 1, 1, 1)
               }
               GradientStop {
                  position: 0.667
                  color: Qt.rgba(0, 0, 1, 1)
               }
               GradientStop {
                  position: 0.833
                  color: Qt.rgba(1, 0, 1, 1)
               }
               GradientStop {
                  position: 1.000
                  color: Qt.rgba(1, 0, 0, 1)
               }
        }
    }
}

