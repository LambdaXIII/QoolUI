import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Components 1.0
import Qool.Controls 1.0
import Qool.Styles 1.0
import "internal_functions.js" as IntFuncs

BasicInputControl {
  id: control

  property real minValue: 0
  property real maxValue: 100
  property real defaultValue: 1
  property real value: 1
  property real stepValue: 5 //默认的每一步步长
  function resetValue() {
    value = defaultValue
  }
  property string unit

  property int decimals: 2 //四舍五入小数位数
  property bool keepExtraZeros: false //保持末尾多余的0
  property bool editable: true
  property bool cycleNumber: false //是否回环数值
  property bool showIndicator: true //显示下方的指示器

  property bool wheelControlEnabled: true

  readonly property real valueRange: maxValue - minValue

  contentItem: Item {
    Text {
      id: showedText
      text: textEdit.text + control.unit
      color: QoolStyle.textColor
      horizontalAlignment: TextInput.AlignRight
      verticalAlignment: TextInput.AlignVCenter
      anchors.fill: parent
      visible: !textEdit.visible
    }
    TextInput {
      id: textEdit
      visible: focus
      //      activeFocusOnPress: false
      activeFocusOnTab: false
      color: QoolStyle.warningColor
      selectionColor: QoolStyle.infoColor
      selectedTextColor: control.backBox.backColor
      clip: true
      selectByMouse: true
      horizontalAlignment: TextInput.AlignRight
      verticalAlignment: TextInput.AlignVCenter
      anchors.fill: parent
      text: control.value.toString()
      enabled: control.editable
      inputMethodHints: Qt.ImhPreferNumbers
      onAccepted: {
        value = core.value_checker(displayText)
        focus = false
      }
      z: 2
      leftPadding: activeFocus ? editingIndicator.width : 0
      SmallIndicator {
        id: editingIndicator
        text: qsTr("编辑模式")
        backColor: QoolStyle.highlightColor
        y: (parent.height - height) / 2
      }
    } //TextInput

    Item {
      //进度指示器
      z: -1
      visible: control.showIndicator && (!textEdit.focus)
      anchors.fill: parent
      opacity: 0.6
      Rectangle {
        id: progressBar
        readonly property real progress: (control.value - control.minValue) / control.valueRange
        x: parent.width - width
        y: parent.height - height
        width: 2 + (parent.width - 2) * progress
        border.width: 0
        color: control.enabled ? QoolStyle.highlightColor : QoolStyle.negativeColor
        height: dragArea.hovered ? parent.height : 2
        radius: 3
        Behavior on width {
          enabled: control.animationEnabled
          SmoothedAnimation {}
        }
        Behavior on height {
          enabled: control.animationEnabled
          SmoothedAnimation {}
        }
      } //mainBar
    } //indicator

    MouseArea {
      id: dragArea
      anchors.fill: parent
      hoverEnabled: true
      property bool busy: false
      readonly property real offset_ratio: valueRange / (width - 2)
      property bool hovered: false
      //      onPressed: setup_value(mouseX)
      onPositionChanged: if (pressed)
                           setup_value(mouseX)
      onEntered: hovered = true
      onExited: hovered = false
      onDoubleClicked: if (control.editable) {
                         textEdit.focus = true
                         textEdit.selectAll()
                       }

      function setup_value(mx) {
        if (!busy) {
          busy = true
          let old_v = control.value
          let new_v = (dragArea.width - mx) * offset_ratio
          control.value = core.value_checker(new_v)
          busy = false
        }
      } //function
    }
  } //contentItem:

  QtObject {
    id: core
    function value_checker(x) {
      let a = Number.parseFloat(x)
      let n = control.cycleNumber ? cycle_checker(a) : line_checker(a)
      return value_formatter(n)
    }

    function line_checker(a) {
      if (a < control.minValue)
        return control.minValue
      if (a > control.maxValue)
        return control.maxValue
      return a
    }

    function cycle_checker(a) {
      //回环数值切割
      var x = a
      while (x < control.minValue) {
        x += control.maxValue
      }
      if (x > control.maxValue)
        x = x % control.maxValue
      return x
    }

    function value_formatter(x) {
      let a = x.toFixed(control.decimals)
      if (control.keepExtraZeros)
        return a
      return IntFuncs.cutZero(a)
    }
  }
}
