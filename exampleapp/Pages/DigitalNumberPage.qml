import QtQuick 2.14
import Qool.Components 1.0
import "./ExtraControls"
import Qool.Styles 1.0

ExpPage {
  pageTitle: qsTr("数码数字控件展示")

  Grid {
    columns: 14
    columnSpacing: 2
    rowSpacing: 4
    anchors.centerIn: parent
    Repeater {
      model: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
      delegate: DigitalNumber {
        text: modelData
        width: 20
        height: 40
        partWidth: 4
        partShrinkWidth: 1
        partColor: /[a-z]/.test(
                     text) ? QoolStyle.infoColor : /[A-Z]/.test(
                               text) ? QoolStyle.warningColor : QoolStyle.highlightColor
      }
    }
  } //column
}
