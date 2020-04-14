import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Components 1.0
import Qool.Styles 1.0

Control {
  id: control

  property alias backBox: backBox
  property alias titleText: titleText
  property bool alterBackgroundColor: true
  background: CutCornerBox {
    id: backBox
    cutSize: QoolStyle.controlCutSize
    backColor: alterBackgroundColor ? QoolStyle.controlBackgroundColor2 : QoolStyle.controlBackgroundColor
    Text {
      id: titleText
      text: qsTr("控件标题")
      color: QoolStyle.backgroundStrokeColor
      font.pixelSize: 12
      horizontalAlignment: Text.AlignRight
      verticalAlignment: Text.AlignVCenter
      anchors.top: backBox.top
      anchors.right: backBox.right
      anchors.margins: 2 + backBox.strokeWidth
      readonly property real bottomLineY: backBox.strokeWidth + anchors.topMargin
                                          + (visible ? height : 0)
    }

    readonly property real avaluableTopSpace: Math.max(backBox.strokeWidth,
                                                       backBox.cutSize)
  }

  topPadding: Math.max(backBox.avaluableTopSpace, titleText.bottomLineY)
  leftPadding: backBox.strokeWidth
  rightPadding: backBox.strokeWidth
  bottomPadding: backBox.strokeWidth
}
