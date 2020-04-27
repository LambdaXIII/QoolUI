import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Styles 1.0
import Qool.Components 1.0

TabButton {
  id: control

  property int verticalAlignment: Text.AlignVCenter
  property int horizontalAlignment: Text.AlignHCenter

  property alias backBox: backBox

  implicitHeight: implicitContentHeight + topPadding + bottomPadding
  implicitWidth: implicitContentWidth + leftPadding + rightPadding

  background: CutCornerBox {
    id: backBox
    cutSize: QoolStyle.buttonCutSize
    strokeColor: checked ? QoolStyle.backgroundColor : QoolStyle.backgroundStrokeColor
    backColor: checked ? QoolStyle.highlightColor : QoolStyle.controlBackgroundColor2
  }

  topPadding: backBox.strokeWidth
  leftPadding: backBox.strokeWidth + backBox.cutSize
  rightPadding: backBox.strokeWidth
  bottomPadding: backBox.strokeWidth

  contentItem: Text {
    id: mainText
    text: control.text
    verticalAlignment: control.verticalAlignment
    horizontalAlignment: control.horizontalAlignment
    elide: Text.ElideMiddle
    color: checked ? QoolStyle.backgroundColor : QoolStyle.textColor
  }
}
