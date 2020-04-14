import QtQuick 2.14
import Qool.Styles 1.0

QoolAbstractButton {
  id: control

  contentItem: Text {
    id: mainText
    text: control.text
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    color: enabled ? (checked ? QoolStyle.highlightColor : QoolStyle.textColor) : QoolStyle.disabledColor
  }
}
