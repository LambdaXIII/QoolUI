import QtQuick 2.14
import Qool.Styles 1.0

Text {
  id: root
  text: qsTr("不让用")

  property color backColor: QoolStyle.warningColor
  property color strokeColor: QoolStyle.backgroundColor

  property alias strokeWidth: box.border.width

  font.pixelSize: 8
  color: strokeColor
  font.bold: true

  leftPadding: 3
  rightPadding: 3
  topPadding: 2
  bottomPadding: 2

  Rectangle {
    id: box
    anchors.fill: parent
    radius: 3
    border.color: strokeColor
    border.width: 1
    color: backColor
    z: -1
  }
}
