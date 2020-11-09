import QtQuick 2.14
import Qool.Components 1.0
import "./ExtraControls"

ExpPage {
  pageTitle: qsTr("数码数字控件展示")

  Column {
    anchors.centerIn: parent
    DigitalNumber {
      id: num
      width: 120
      height: 200
      partWidth: 20
      partShrinkWidth: 1
      text: (bar.progress * 10).toString()
    }

    ClickBar {
      id: bar
      width: 200
      height: 15
      progress: 0.8
    }
  } //column
}
