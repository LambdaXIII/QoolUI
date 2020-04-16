import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Styles 1.0

RadioButton {
  id: control

  property color highColor: QoolStyle.highlightColor

  indicator: Rectangle {
    x: control.leftPadding
    y: (control.height - height) / 2
    implicitHeight: mainText.height
    width: height
    border.width: 1
    border.color: hovered ? highColor : QoolStyle.textColor
    color: "transparent"
    Rectangle {
      anchors.fill: parent
      anchors.margins: 3
      color: parent.border.color
      visible: control.checked
    }
  }

  contentItem: Text {
    id: mainText
    text: control.text
    color: QoolStyle.textColor
    leftPadding: indicator.width + control.spacing
    font: control.font
  }
}
