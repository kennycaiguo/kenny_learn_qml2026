import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Image{
        id:pic
        source: "qrc:/assets/butterfly.png"
        width:parent.width;height: parent.height
        smooth: true
        visible: false
    }

    RadialGradient {
        anchors.fill: parent
        // source:pic //注意，只有png格式的图片才能够填充，jpg没有效果
        horizontalOffset:0
        horizontalRadius:300
        verticalRadius:300
        verticalOffset: 75
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
