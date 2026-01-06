import QtQuick

Item {
    id:root
        width: 640
        height: 480
        property int duration: 3000
        //天空背景
        Rectangle{
            id:sky
            width: parent.width
            height: 200
            gradient: Gradient{
                GradientStop{ position: 0.0; color: "#0080FF" }
                GradientStop{ position: 1.0; color: "#66CCFF" }
            }
        }

        //地上背景
        Rectangle{
            id:grnd
            width: parent.width
            anchors.top: sky.bottom
            anchors.bottom: parent.bottom
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#00FF00" }
                GradientStop { position: 1.0; color: "#00803F" }
            }
        }
        //足球图片
        Image {
            id: ball
            source: "qrc:/assets/soccer_ball.png"
            x:0;y:root.height - height
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //先复位
                    ball.x = 0
                    ball.y = parent.height - ball.height
                    ball.rotation = 0
                    anim.restart()
                }
            }
        }
        //组合动画
        ParallelAnimation{
            id:anim

            SequentialAnimation{
                //y坐标往上移动
                NumberAnimation{
                    target:ball
                    property: "y"
                    to:20
                    duration: root.duration * 0.4
                    // easing.type: Easing.OutCirc
                    easing.type: Easing.InBack
                }
                //y坐标到达20后往下移动
                NumberAnimation{
                    target:ball
                    property: "y"
                    to:root.height - ball.height
                    duration: root.duration * 0.6
                    easing.type: Easing.OutBounce
                }
            }
            //x坐标往右移动
            NumberAnimation{
                target:ball
                property: "x"
                to:root.width - ball.width
                duration: root.duration
            }
            //旋转动画
            RotationAnimation{
                target: ball
                property: "rotation"
                to:720
                duration: root.duration

            }
        }

}
