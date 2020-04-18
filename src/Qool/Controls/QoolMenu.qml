import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Components 1.0
import Qool.Styles 1.0

Menu {
  id: menu

  property bool showTitle: false

  property real itemWidth: 150
  property real itemHeight: 25

  delegate: QoolMenuItem {
    itemHeight: menu.itemHeight
    itemWidth: menu.itemWidth
  }

  background: CutCornerControlBack {
    id: backBox
    cutSize: menu.showTitle ? QoolStyle.menuCutSize : 0
    titleText.visible: showTitle
    titleText.text: menu.title
    implicitWidth: itemWidth + menu.leftPadding + menu.rightPadding
    implicitHeight: itemHeight
    alterBackgroundColor: false
  }

  topPadding: backBox.contentTopSpace
  bottomPadding: backBox.strokeWidth
  leftPadding: backBox.strokeWidth
  rightPadding: backBox.strokeWidth
}
