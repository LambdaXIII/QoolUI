import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Components 1.0
import Qool.Styles 1.0

Control {
  id: control

  property real extraContentPadding: 0

  property alias backBox: backBox
  property alias titleText: backBox.titleText
  property alias alterBackgroundColor: backBox.alterBackgroundColor
  property alias showTitle: backBox.showTitle
  property alias title: backBox.title

  background: CutCornerControlBack {
    id: backBox
  }

  topPadding: backBox.contentTopSpace + extraContentPadding
  leftPadding: backBox.strokeWidth + extraContentPadding
  rightPadding: backBox.strokeWidth + extraContentPadding
  bottomPadding: backBox.strokeWidth + extraContentPadding

  implicitWidth: implicitContentWidth + leftPadding + rightPadding
  implicitHeight: implicitContentHeight + topPadding + bottomPadding
}
