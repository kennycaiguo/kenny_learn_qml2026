import QtQuick
import QtMultimedia

Rectangle {
    id:root
    width: parent.width
    height: parent.height
    border.color: "deeppink"

    MediaPlayer{
        id:player
        source: "qrc:/media/trailer_400p.ogg"
        videoOutput: output
        audioOutput: sound
    }

    VideoOutput{
        id:output
        anchors.fill: parent
    }

    AudioOutput{
        id:sound
    }

    Component.onCompleted: {
        player.play()
    }
}
