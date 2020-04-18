import QtQuick 2.14
import Qool.Controls.Inputs 1.0

ExpPage {
  pageTitle: qsTr("各种输入控件展示")

  Grid {
    anchors.centerIn: parent
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
  }
}
