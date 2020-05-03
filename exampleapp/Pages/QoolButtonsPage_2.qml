import QtQuick 2.0
import Qool.Controls 1.0
import Qool.Styles 1.0

ExpPage {
  pageTitle: qsTr("按钮快速分组")
  Column {
    spacing: 15
    anchors.centerIn: parent
    Text {
      color: QoolStyle.textColor
      text: qsTr(
              "QoolButton 无法使用 Qt 的 ButtonGroup 分组，但是可以通过使用 groupName 属性直接分组，且分组可以动态改变")
      wrapMode: Text.WrapAtWordBoundaryOrAnywhere
      width: 200
    }

    QoolButton {
      width: 200
      height: 25
      text: qsTr("选项1")
      checkable: true
      groupName: "example_button_group"
    }

    QoolButton {
      width: 200
      height: 25
      text: qsTr("选项2")
      checkable: true
      groupName: "example_button_group"
    }

    QoolButton {
      width: 200
      height: 25
      text: qsTr("选项3")
      checkable: true
      groupName: "example_button_group"
    }

    QoolRadioButton {
      width: 200
      text: qsTr("QoolRadioButton也支持")
      checkable: true
      groupName: "example_button_group"
    }
  }
}
