import QtQuick 2.5

Item {
  DarkSquare{
      id:root
      width: 500
      height: 500

      Grid{
          anchors.centerIn: parent
          rows: 2
          columns: 3
          spacing: 8
          //填充父元素,并且预留边距
          GreenSquare{
              BlueSquare{
                  width:12
                  anchors.fill: parent
                  anchors.margins: 20
                  Text {
                          anchors.centerIn: parent
                          text: qsTr("1")
                          color: "deeppink"
                  }
              }
          }
          //和父元素左对齐
          GreenSquare{
              BlueSquare{
                  width:50
                  anchors.left: parent.left
                  // anchors.margins: 10
                  y:20
                  Text {
                          anchors.centerIn: parent
                          text: qsTr("2")
                          color: "deeppink"
                  }
              }
          }

          //左边紧贴父亲得到右边，就会跑到父元素外面
          GreenSquare{
              BlueSquare{
                  width:50
                  anchors.left: parent.right
                  // anchors.margins: 10
                  y:20
                  Text {
                          anchors.centerIn: parent
                          text: qsTr("3")
                          color: "deeppink"
                  }
              }
          }
          //两个兄弟在父元素里面商品居中对齐
          GreenSquare{
              BlueSquare{
                  id:square1
                  width:30
                  anchors.horizontalCenter: parent.horizontalCenter

                  // anchors.margins: 10
                  y:10
                  Text {
                          anchors.centerIn: parent
                          text: qsTr("4")
                          color: "deeppink"
                  }
              }

              BlueSquare{
                  width:30
                  anchors.horizontalCenter: parent.horizontalCenter
                  anchors.topMargin: 10
                  anchors.top: square1.bottom
                  // anchors.margins: 10
                  y:20
                  Text {
                          anchors.centerIn: parent
                          text: qsTr("5")
                          color: "deeppink"
                  }
              }
          }

         //在父元素中垂直居中对齐并且留一个边距
          GreenSquare{
              BlueSquare{
                  width:50
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.margins: 10
                  x:20
                  Text {
                          anchors.centerIn: parent
                          text: qsTr("7")
                          color: "deeppink"
                  }
              }
          }
          //垂直居中偏移量
          GreenSquare{
              anchors.margins: 20
              BlueSquare{
                  width: 60
                  y:15
                  anchors.centerIn: parent
                  anchors.verticalCenterOffset: -15
                  // anchors.margins: 20
                  Text {
                      anchors.centerIn: parent
                      text: qsTr("8")
                      color: "deeppink"
                  }
              }
          }
      }
  }
}
