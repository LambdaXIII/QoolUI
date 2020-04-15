import QtQuick 2.14
import Qool.Styles 1.0

CutCornerBox {
  id: backBox
  property bool alterBackgroundColor: true

  property alias titleText: titleText

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

  readonly property real availableTopSpace: Math.max(backBox.strokeWidth,
                                                     backBox.cutSize)

  readonly property real contentTopSpace: Math.max(availableTopSpace,
                                                   titleText.bottomLineY)
}
