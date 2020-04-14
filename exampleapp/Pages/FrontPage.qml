import QtQuick 2.13
import Qool.Styles 1.0

ExpPage {
  id: element1
  pageTitle: qsTr("欢迎使用！")
  Text {
    id: element
    text: qsTr("QoolUI 元件演示程序")
    anchors.top: parent.top
    anchors.topMargin: 60
    anchors.horizontalCenter: parent.horizontalCenter
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    font.pixelSize: 24
    color: QoolStyle.textColor
  }

  Text {
    id: element2
    text: qsTr("点击左侧选择想看的页面")
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    font.pixelSize: 12
    color: QoolStyle.textColor
  }

  Text {
    id: element3
    color: QoolStyle.textColor
    text: qsTr("项目地址：git@gitee.com:xiii_1991/QoolUI.git")
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 30
    anchors.horizontalCenter: parent.horizontalCenter
    font.pixelSize: 12
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    MouseArea{
      anchors.fill: parent
      acceptedButtons: Qt.LeftButton
      onClicked: Qt.openUrlExternally("https://gitee.com/xiii_1991/QoolUI")
    }
  }
}
