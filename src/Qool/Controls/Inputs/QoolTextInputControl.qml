import QtQuick 2.14
import Qool.Controls 1.0
import Qool.Styles 1.0

BasicInputControl {
  id: control
  property string value
  property string defaultValue
  function resetValue() {
    value = defaultValue
  }
  property string unit

  property alias verticalAlignment: mainText.verticalAlignment
  property alias horizontalAlignment: mainText.horizontalAlignment
  property bool editable: true

  contentItem: TextInput {
    id: mainText
    text: control.value
    clip: true
    color: QoolStyle.textColor
    enabled: control.editable
    selectionColor: QoolStyle.infoColor
    selectedTextColor: control.backBox.backColor
    selectByMouse: true
    verticalAlignment: TextInput.AlignVCenter
    horizontalAlignment: TextInput.AlignRight
    onEditingFinished: {
      control.value = displayText
      focus = false
    }
    rightPadding: unitText.width
    Text {
      id: unitText
      text: control.unit
      font: parent.font
      color: parent.color
    }
  }

  function force_refresh_value() {
    control.value = mainText.text
  }
}
