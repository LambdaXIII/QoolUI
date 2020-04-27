import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Components 1.0
import Qool.Styles 1.0

Popup {
  topMargin: 50
  leftMargin: 25
  rightMargin: 25
  bottomMargin: 25

  padding: 10

  background: CutCornerBox {
    cutSize: QoolStyle.controlCutSize
  }
}
