import QtQuick 2.14
import Qool.Controls 1.0
import Qool.Styles 1.0

BasicInputControl {
  id: control
  property string value
  property alias verticalAlignment: mainText.verticalAlignment
  property alias horizontalAlignment: mainText.horizontalAlignment

  contentItem: TextInput {
    id: mainText
    text: control.value

    color: QoolStyle.textColor
    selectionColor: QoolStyle.infoColor
    selectedTextColor: control.backBox.backColor
    selectByMouse: true
    verticalAlignment: TextInput.AlignVCenter
    horizontalAlignment: TextInput.AlignRight
    onEditingFinished: {
      control.value = displayText
      focus = false
    }
  }
}
