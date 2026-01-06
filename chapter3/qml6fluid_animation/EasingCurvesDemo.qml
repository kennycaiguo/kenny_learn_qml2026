import QtQuick

DarkSquare {
    id:root
    width: 600
    height: 340
    property variant easyings:[
        "Linear", "InQuad", "OutQuad", "InOutQuad",
        "InCubic", "InSine", "InCirc", "InElastic",
        "InBack", "InBounce"]

    Grid{
        columns: 5
        spacing: 20
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
        height: 200
        Repeater{
            model: root.easyings
            ImageBtn2{
                text:modelData
                source: "qrc:/curves/"+modelData+".png"
                onClicked: {
                    console.log(modelData)
                    anim.easing.type  = modelData
                    anim.start()
                    // console.log(anim.easing.type)
                }
            }


        }

    }
    GreenSquare{
        id:square
        x:40;y:260
    }

    NumberAnimation{
        id:anim
        target: square
        property: "x"
        from: 40
        to: root.width - 40 - square.width
        duration:3000
    }
   // NumberAnimation{
   //      id:anim
   //      target: square
   //      property: "y"
   //      from: 260
   //      to: 40
   //      duration: 2000
   //  }
}
