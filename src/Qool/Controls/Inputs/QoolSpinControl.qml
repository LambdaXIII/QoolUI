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
  property real defaultValue: minValue
  property real value: defaultValue
  property real stepValue: 5 //默认的每一步步长

  property int decimals: 2 //四舍五入小数位数
  property bool keepExtraZeros: false //保持末尾多余的0
  property bool editable: true
  property bool cycleNumber: false //是否回环数值
  property bool showIndicator: true //显示下方的指示器

  property bool wheelControlEnabled: true

  readonly property real valueRange: maxValue - minValue

  contentItem: Item {
    Row {
      id: buttons
      anchors.verticalCenter: parent.verticalCenter
      BasicInputSmallButton {
        animationEnabled: control.animationEnabled
        text: qsTr("加")
        onClicked: {
          let v = control.value + control.stepValue
          control.value = core.value_checker(v)
        }
      }
      BasicInputSmallButton {
        text: qsTr("减")
        animationEnabled: control.animationEnabled
        onClicked: {
          let v = control.value - control.stepValue
          control.value = core.value_checker(v)
        }
      }
    }

    TextInput {
      color: QoolStyle.textColor
      selectionColor: QoolStyle.infoColor
      selectedTextColor: QoolStyle.textColor
      selectByMouse: true
      horizontalAlignment: TextInput.AlignRight
      verticalAlignment: TextInput.AlignVCenter
      anchors.fill: parent
      anchors.leftMargin: buttons.width
      text: control.value.toString()
      enabled: control.editable
      onEditingFinished: {
        value = core.value_checker(displayText)
        focus = false
      }
      WheelHandler {
        enabled: control.wheelControlEnabled
        acceptedButtons: Qt.NoButton
        property bool busy: false
        onWheel: if (!busy) {
                   busy = true
                   let old_value = control.value
                   let aspect_of_a_step = event.angleDelta.y / 8 / 60
                   var delta = control.stepValue * aspect_of_a_step
                   if (control.decimals > 1) {
                     let abs_value = Math.abs(old_value)
                     if (abs_value < 1)
                       delta = aspect_of_a_step * 0.1
                     if (abs_value >= 1)
                       delta = Math.round(delta)
                   }
                   var new_value = old_value + delta
                   control.value = core.value_checker(new_value)
                   busy = false
                 }
      } //WheelHandler
    } //TextInput

    Item {
      //下方指示器
      visible: control.showIndicator
      width: parent.width
      y: parent.height - height
      height: 2
      opacity: 0.6
      Rectangle {
        readonly property real progress: (control.value - control.minValue) / control.valueRange
        x: parent.width - width
        width: 2 + (parent.width - 2) * progress
        border.width: 0
        color: control.enabled ? QoolStyle.highlightColor : QoolStyle.negativeColor
        height: parent.height
        Behavior on width {
          enabled: control.animationEnabled
          SmoothedAnimation {}
        }
      }
    } //indicator
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
