import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Components 1.0
import Qool.Styles 1.0

Control {
  id: control

  property alias backBox: backBox
  property alias titleText: backBox.titleText

  property alias alterBackgroundColor: backBox.alterBackgroundColor

  background: CutCornerControlBack {
    id: backBox
  }

  topPadding: backBox.contentTopSpace
  leftPadding: backBox.strokeWidth
  rightPadding: backBox.strokeWidth
  bottomPadding: backBox.strokeWidth
}
