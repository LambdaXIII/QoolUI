import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Components 1.0
import Qool.Styles 1.0

MenuSeparator {
  id: root

  property bool alterColor: false
  property color backColor: alterColor ? QoolStyle.infoColor : QoolStyle.tooltipColor
  property color textColor: QoolStyle.backgroundColor
  property string text
  property alias contentText: contentText
  property alias radius: backBox.radius

  topInset: 3
  bottomInset: topInset
  leftInset: 3
  rightInset: leftInset

  horizontalPadding: 8
  verticalPadding: 5

  font.pixelSize: QoolStyle.tooltipTextFontPixelSize

  background: Rectangle {
    id: backBox
    color: root.backColor
    border.color: root.textColor
    border.width: 1
    radius: 3
  }

  contentItem: Text {
    id: contentText
    text: root.text
    color: root.textColor
    font: root.font
    horizontalAlignment: Text.AlignHCenter
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
  }
}
