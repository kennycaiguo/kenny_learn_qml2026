import QtQuick
import QtMultimedia

//我自己的媒体仓库：https://github.com/kennycaiguo/kenny-test-qmlsite
/*
这个仓库做成了GitHub page： https://kennycaiguo.github.io/kenny-test-qmlsite/，
如果需要播放媒体，网址如下：
https://kennycaiguo.github.io/kenny-test-qmlsite/Goofy.mp4
https://kennycaiguo.github.io/kenny-test-qmlsite/LuckyDay.wav
https://kennycaiguo.github.io/kenny-test-qmlsite/t1.ogg

*/

Rectangle {
    id:root
    width: parent.width
    height: parent.height
    border.color: "deeppink"

    MediaPlayer{
        id:player
        // source: "qrc:/media/trailer_400p.ogg"
        // source: "file:///E:\\videos\\1920_2_3MG.avi"
        // source:"https://kennycaiguo.github.io/kenny-test-qmlsite/Goofy.mp4"
        // source:"https://kennycaiguo.github.io/kenny-test-qmlsite/t1.ogg"
        source:"https://kennycaiguo.github.io/kenny-test-qmlsite/LuckyDay.wav"  //音乐

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
