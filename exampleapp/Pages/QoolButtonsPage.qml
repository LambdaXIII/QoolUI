import QtQuick 2.0
import Qool.Controls 1.0

ExpPage {
  pageTitle: qsTr("酷酷的普通文本按钮")
  Column {
    spacing: 15
    anchors.centerIn: parent
    QoolTextButton {
      id: bb
      width: 200
      height: 50
      text: qsTr("可以勾选的按钮")
      checkable: true
    }

    QoolTextButton {
      width: 200
      height: 50
      text: qsTr("禁用的按钮")
      enabled: false
    }

    QoolTextButton {
      width: 200
      height: 50
      text: qsTr("普通文本按钮")
    }
  }
}
