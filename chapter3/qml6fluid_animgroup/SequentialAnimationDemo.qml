import QtQuick

Item {

    id:root
    property int duration: 2000
    ImageBtn {
        id: ufo
        x:20;y:200
        source: "qrc:/assets/ufosm.png"
        text: "ufo"
        onClicked: anim.restart()
    }

    SequentialAnimation{
        id:anim
        NumberAnimation {
            target: ufo
            property: "y"
            from: 200
            to:20
            duration: root.duration
        }
        NumberAnimation {
            target: ufo
            property: "x"
            from: 40
            to:200
            duration: root.duration
        }
    }
}

