import QtQuick 2.14
import Qool.Controls 1.0

ExpPage {
  pageTitle: qsTr("QoolUI 自带的对话框展示")

  QoolButton {
    anchors.centerIn: parent
    width: 200
    height: 25
    text: qsTr("打开对话框")
    onClicked: dialog.show()
  }

  QoolDialogWindow {
    id: dialog
    width: 400
    height: 300
    title: qsTr("展示用对话框")
    hasOKButton: okSwitch.checked
    hasCancelButton: cancelSwitch.checked
    showToolBar: barSwitch.checked
    resizable: resizeSwitch.checked
    Column {
      anchors.centerIn: dialog.hiddenBox
      spacing: 6

      QoolRadioButton {
        id: okSwitch
        text: qsTr("显示OK按钮")
        checked: true
        width: 200
        height: 25
      }
      QoolRadioButton {
        id: cancelSwitch
        text: qsTr("显示Cancel按钮")
        checked: true
        width: 200
        height: 25
      }
      QoolRadioButton {
        id: barSwitch
        text: qsTr("显示工具栏")
        checked: true
        width: 200
        height: 25
      }
      QoolRadioButton {
        id: resizeSwitch
        text: qsTr("切换缩放指示器")
        checked: true
        width: 200
        height: 25
      }
    }

    Rectangle {
      id: mainRangeBox
      color: "black"
      anchors.fill: dialog.hiddenBox
      opacity: 0.3
      radius: 5
      z: -20
    }
    Text {
      x: mainRangeBox.x + 5
      y: mainRangeBox.y + 5
      text: qsTr("这个深色块块是布局的主要区域")
      color: "white"
      font.pixelSize: 10
      opacity: 0.8
    }

    QoolDialogButton {
      text: qsTr("自行添加的按钮")
      parent: dialog.toolBarRow
    }
  }
}
