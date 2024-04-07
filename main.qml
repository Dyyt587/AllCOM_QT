import QtQuick
import FluentUI

// 注意这里，如果报错的话可能是前面构建FluentUI失败。检查这种路径F:\Qt\6.5.2\mingw_64\qml\FluentUI

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    FluFilledButton {
        width: 100
        height: 50
        anchors.centerIn: parent
        text: "HelloWorld"
    }
}
