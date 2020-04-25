import QtQuick 2.14
import QtQuick.Dialogs 1.2
import Qool.Styles 1.0
import Qool.Components 1.0
import "internal_functions.js" as IntFuncs

BasicInputControl {
  id: control

  enum NameType {
    None,
    RGB,
    HSL,
    HSV,
    CMYK,
    HEX,
    NAME
  }

  property color value: QoolStyle.textColor
  property color defaultValue: QoolStyle.textColor
  function resetValue() {
    value = defaultValue
  }

  property int nameType: QoolColorControl.None
  property bool alphaEnabled: false //开启透明度支持
  readonly property string currentText: colorist.calc_name(value)

  ColorDialog {
    id: colorDialog
    onAccepted: control.value = colorDialog.color
    onVisibleChanged: if (visible) {
                        color = control.value
                      }
    showAlphaChannel: control.alphaEnabled
  } //colorDialog

  contentItem: Item {
    Rectangle {
      id: mainColorRect
      border.width: 0
      color: control.value
      anchors.fill: parent
      radius: 3
      opacity: enabled ? 1 : 0.2
      Behavior on color {
        enabled: control.animationEnabled
        ColorAnimation {
          duration: 300
        }
      }
    }

    MouseArea {
      anchors.fill: parent
      onClicked: colorDialog.open()
    }

    Text {
      id: mainText
      anchors.fill: mainColorRect
      horizontalAlignment: Text.AlignRight
      verticalAlignment: Text.AlignBottom
      text: control.currentText
      color: colorist.blackOrWhite(control.value, false)
      font.pixelSize: QoolStyle.tooltipTextFontPixelSize
      rightPadding: 2
      leftPadding: rightPadding
      wrapMode: Text.WordWrap
    }
  } //contentItem

  Colorist {
    id: colorist
    function mk255(x) {
      let a = 255 * x
      return Math.round(a)
    }
    function mk360(x) {
      let a = 360 * x
      return Math.round(a)
    }
    function mk100(x) {
      let a = 100 * x
      return Math.round(a)
    }

    function calc_name(x) {
      var res = ""
      var add_alpha = false
      if (control.nameType === QoolColorControl.RGB) {
        let v = rgb(control.value)
        let rr = mk255(v[0])
        let gg = mk255(v[1])
        let bb = mk255(v[2])
        res = "R:${0} G:${1} B:${2}".format(rr, gg, bb)
        add_alpha = control.alphaEnabled
      }
      if (control.nameType === QoolColorControl.HSL) {
        let v = hsl(control.value)
        let rr = mk360(v[0])
        let gg = mk255(v[1])
        let bb = mk255(v[2])
        res = "H:${0}° S:${1} L:${2}".format(rr, gg, bb)
        add_alpha = control.alphaEnabled
      }
      if (control.nameType === QoolColorControl.HSV) {
        let v = hsv(control.value)
        let rr = mk360(v[0])
        let gg = mk255(v[1])
        let bb = mk255(v[2])
        res = "H:${0}° S:${1} V:${2}".format(rr, gg, bb)
        add_alpha = control.alphaEnabled
      }
      if (control.nameType === QoolColorControl.CMYK) {
        let v = cmyk(control.value)
        let rr = mk100(v[0])
        let gg = mk100(v[1])
        let bb = mk100(v[2])
        let kk = mk100(v[3])
        res = "C:${0}% M:${1}% Y:${2}% K:${3}%".format(rr, gg, bb, kk)
        add_alpha = control.alphaEnabled
      }
      if (control.nameType === QoolColorControl.HEX) {
        res = hex(control.value, control.alphaEnabled).toUpperCase()
      }
      if (control.nameType === QoolColorControl.NAME) {
        res = name(control.value, control.alphaEnabled).toUpperCase()
      }

      if (add_alpha) {
        let alpha_percent = alpha(control.value)
        res += " A:${0}%".format(mk100(alpha_percent))
      }

      return res
    } //function
  } //colorist
}
