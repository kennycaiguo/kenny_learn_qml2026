import QtQuick

Item {
    id: root
    property int duration: 3000
    ImageBtn{
        id:btn1
        x:40;y:200
        source: "qrc:/assets/box_green.png"
        text: "Animation on property"
        NumberAnimation on y{
            to: 40
            duration: root.duration
        }
    }

    ImageBtn{
        id:btn2
        x:150;y:200
        source: "qrc:/assets/box_red.png"
        text: "Behavior on property"
        Behavior on y{
            NumberAnimation{
                duration: root.duration
            }
        }
        onClicked: {
            y = 40 + Math.random()*(205-40)
        }
    }


    ImageBtn{
        id:btn3
        x:280;y:200
        source: "qrc:/assets/box_blue.png"
        text: "Stand Alone Animation"

        NumberAnimation{
            id:anim
            target: btn3
            property: "y"
            from:200
            to:40
            duration: root.duration
        }

        onClicked: anim.start()
    }
}
