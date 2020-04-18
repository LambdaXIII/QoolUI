import QtQuick 2.14
import Qool.Styles 1.0

QoolAbstractButton {
  id: control

  checkable: true

  implicitWidth: mainText.implicitWidth + leftPadding + rightPadding + backBox.cutSize*2
  implicitHeight: mainText.implicitHeight + topPadding + bottomPadding + 4

  readonly property real indicatorMargin: 2

  contentItem: Item {
    Rectangle {
      id: indicator
      height: parent.height - indicatorMargin * 2
      width: 10
      border.width: 0
      x: parent.width - width - indicatorMargin
      y: 2
      color: down ? QoolStyle.highlightColor : checked ? QoolStyle.positiveColor : QoolStyle.negativeColor
      Behavior on color {
        enabled: animationEnabled
        ColorAnimation {
          duration: 300
        }
      }
    }

    Text {
      id: mainText
      text: control.text
      font: control.font
      horizontalAlignment: Text.AlignRight
      verticalAlignment: Text.AlignVCenter
      color: QoolStyle.textColor
      anchors.fill: parent
      rightPadding: indicator.width + control.spacing + indicatorMargin * 2
    }
  }
}
