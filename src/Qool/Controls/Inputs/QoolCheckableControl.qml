import QtQuick 2.14
import Qool.Styles 1.0
import Qool.Components 1.0

BasicInputControl {
  id: control

  property bool checked: false
  property string text
  property alias horizontalAlignment: mainText.horizontalAlignment
  property alias verticalAlignment: mainText.verticalAlignment

  signal toggled(bool checked)

  backBox.strokeColor: checked ? QoolStyle.highlightColor : QoolStyle.backgroundStrokeColor

  contentItem: Text {
    id: mainText
    text: control.text
    font: control.font
    color: QoolStyle.textColor
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    SmallIndicator {
      id: checkIndicator
      text: control.checked ? qsTr("开") : qsTr("关")
      backColor: control.checked ? QoolStyle.highlightColor : QoolStyle.textColor
      y: (parent.height - height) / 2
      Behavior on backColor {
        enabled: control.animationEnabled
        ColorAnimation {
          duration: 300
        }
      }
    }

    clip: true
    leftPadding: checkIndicator.width
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    fontSizeMode: Text.Fit

    MouseArea {
      id: mArea
      anchors.fill: parent
      hoverEnabled: true
      acceptedButtons: Qt.LeftButton
      onClicked: {
        control.checked = !control.checked
        toggled(control.checked)
      }
    }
  } //contentItem

  CutCornerHighlightCover {
    visible: mArea.pressed
    cutSize: backBox.cutSize
  }
}
