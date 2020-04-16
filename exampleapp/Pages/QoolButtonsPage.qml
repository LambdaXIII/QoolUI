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
      animationEnabled: animButton.checked
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
      animationEnabled: animButton.checked
    }

    QoolRadioButton {
      id: animButton
      text: qsTr("开启动画效果")
      width: 200
      height: 25
      animationEnabled: animButton.checked
    }
  }
}
