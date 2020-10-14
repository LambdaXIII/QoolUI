import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Styles 1.0

AbstractButton {
  id: control

  width: 100
  height: 14

  background: Rectangle {
    color: down ? QoolStyle.textColor : checked ? QoolStyle.highlightColor : QoolStyle.controlBackgroundColor2
    border.width: 1
    border.color: hovered
                  || checked ? QoolStyle.highlightColor : QoolStyle.controlBackgroundColor2
  }

  contentItem: Text {
    text: control.text
    font.pixelSize: control.height - 2
    verticalAlignment: Qt.AlignVCenter
    horizontalAlignment: Qt.AlignHCenter
    color: checked
           || down ? QoolStyle.controlBackgroundColor2 : QoolStyle.textColor
  }
}
