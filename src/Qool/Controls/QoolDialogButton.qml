import QtQuick 2.14
import Qool.Styles 1.0

QoolButton {
  showTitle: false
  height: 20
  implicitWidth: Math.max(
                   implicitContentWidth + leftPadding + rightPadding + backBox.cutSize * 2,
                   80)
  backBox.cutSize: 5

  backBox.backColor: Qt.darker(highlightColor, 6)
}
