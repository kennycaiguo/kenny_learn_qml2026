import QtQuick
import QtQuick.Controls


Rectangle {
    id: root
    width: 300; height: 300
    color: "lightgrey"

    // 1. 定义需要抓取的组件
    Rectangle {
        id: imageSource
        width: 100; height: 100
        color: "blue"
        anchors.centerIn: parent
        Text { anchors.centerIn: parent; text: "抓取我"; color: "white" }
    }

    Button {
        text: "保存图片"
        anchors.bottom: parent.bottom
        onClicked: {
            // 2. 调用 grabToImage
            imageSource.grabToImage(function(result) {
                // 3. 将结果保存为文件
                if (result.saveToFile("captured_image.png")) {
                    console.log("图片已保存");
                } else {
                    console.error("保存失败");
                }
            });
        }
    }
}
