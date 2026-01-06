import QtQuick 2.5

Item{
    DarkSquare {
        id:root
        anchors.fill: parent
        focus: true

        GreenSquare{
            id:box
            x:8;y:8
        }
    }

}
