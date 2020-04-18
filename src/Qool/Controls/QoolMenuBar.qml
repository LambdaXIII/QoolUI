import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Components 1.0
import Qool.Styles 1.0

MenuBar {
  id: menuBar

  background: CutCornerBox {
    id: backgroundBox
    implicitHeight: 15
    cutSize: QoolStyle.menuCutSize
    backColor: QoolStyle.controlBackgroundColor
  }

  delegate: MenuBarItem {
    id: menuBarItem

    font.pixelSize: QoolStyle.menuBarFontPixelSize
    contentItem: Text {
      text: menuBarItem.text
      font: menuBarItem.font
      color: menuBarItem.highlighted ? QoolStyle.highlightColor : QoolStyle.textColor
    }
    background: Rectangle {
      height: 3
      width: parent.width - backgroundBox.strokeWidth * 2
      color: QoolStyle.highlightColor
      anchors.bottom: parent.bottom
      visible: menuBarItem.highlighted
    }
  } //delegate
}
