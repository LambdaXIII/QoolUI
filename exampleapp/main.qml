import QtQuick 2.14
import Qool.Controls 1.0

QoolWindow {
  visible: true
  width: 640
  height: 480
  title: qsTr("QmlCoolStuff 测试窗口")

  //  closeButtonEnabled: false


  /*
  CutCornerBox {
    anchors.fill: parent
    anchors.margins: 20
    strokeColor: "green"
    strokeWidth: 20
    backColor: "black"
    cutSize: 80
  }
  */
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
