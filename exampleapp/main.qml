import QtQuick 2.14
import Qool.Controls 1.0

QoolWindow {
  visible: true
  width: 660
  height: 480
  title: qsTr("QoolUI 测试窗口")

  Item {
    anchors.fill: hiddenBox
    PageSelector {
      id: selector
      x: 0
      y: 0
      width: 160
      height: parent.height
      onPageSelected: loader.changePage(page)
    }

    ExamplePageLoader {
      id: loader
      x: selector.width + 10
      height: parent.height
      width: parent.width - selector.width - 10
      pageSource: "Pages/FrontPage.qml"
    }
  }
}
