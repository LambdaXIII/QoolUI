import QtQuick 2.14
import Qool.Controls.Inputs 1.0

ExpPage {
  pageTitle: qsTr("各种输入控件展示")

  Grid {
    //    anchors.centerIn: parent
    x: (parent.width - width) / 2
    spacing: 6
    columns: 2
    QoolTextInputControl {
      title: qsTr("文本输入框")
      value: qsTr("在此输入文本内容")
    }
    QoolTextInputControl {
      title: qsTr("禁用的文本输入框")
      value: qsTr("被禁用就没办法啦")
      enabled: false
    }
    QoolSwitchControl {
      id: switcher
      title: qsTr("多选项切换框")
      tags: ["苹果", "橘子", "香蕉", "苦瓜"]
      onSwitched: switcher2.switchToNext()
    }
    QoolSwitchControl {
      id: switcher2
      title: qsTr("锁定的多选项切换器")
      tags: ["苹果", "橘子", "香蕉", "苦瓜"]
      currentIndex: 2
      enabled: switcher.currentIndex % 2 != 0
    }
  }
}
