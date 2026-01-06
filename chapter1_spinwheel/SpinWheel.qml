import QtQuick

Item {
  id:root
  anchors.fill: parent
  property int rotationStep: 30

  Image {
      id: bg
      source: "qrc:/images/background.png"
      anchors.fill: parent
  }
  //柱子
  Image{
      id:pole
      x: (parent.width - width)/2
      y:(parent.height - height)/2 + 100
      source: "qrc:/images/pole.png"
  }
  //风车
  Image{
      id:wheel
      source: "qrc:/images/pinwheel.png"
      anchors.centerIn: parent
      Behavior on rotation{
          NumberAnimation{duration:125}
      }
  }
  //风车模糊效果图片
  Image{
      id:blur
      source: "qrc:/images/blur.png"
      anchors.centerIn: parent
      opacity: 0 //默认是隐藏
      Behavior on rotation{
          NumberAnimation{duration:125}
      }

      Behavior on opacity{
          NumberAnimation{duration:125}
      }
  }

  focus: true
  //案件事件，按下←方向键风车按逆时针旋转，按下→方向键，风车按顺时针旋转
  Keys.onLeftPressed: {
      blur.rotation -= root.rotationStep
      blur.opacity = 1
      wheel.rotation -= root.rotationStep
  }
  Keys.onRightPressed: {
      blur.rotation += root.rotationStep
      blur.opacity = 0.5
      wheel.rotation += root.rotationStep
  }
}
