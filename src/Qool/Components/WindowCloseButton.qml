import QtQuick 2.14

import Qool.Basic 1.0
import Qool.Styles 1.0

BasicWindowCloseButton {
  id: control
  width: 20
  height: width

  strokeColor: QoolStyle.backgroundColor

  fillColor: down ? "white" : hovered ? QoolStyle.highlightColor : QoolStyle.warningColor
}
