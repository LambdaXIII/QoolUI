import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Components 1.0
import Qool.Styles 1.0

TextInput {
  id: root
  property bool enableLockedCover: true
  ControlLockedCover {
    anchors.fill: parent
    visible: enableLockedCover && !root.enabled
  }

  color: QoolStyle.textColor
  selectionColor: QoolStyle.infoColor
  selectedTextColor: QoolStyle.textColor
  selectByMouse: true

  onEditingFinished: focus = false
}
