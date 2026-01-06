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

    ParallelAnimation{
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
            from: 20
            to:200
            duration: root.duration
        }
    }
}
