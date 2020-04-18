import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Styles 1.0

MenuSeparator {
  contentItem: Rectangle {
    implicitWidth: 200
    implicitHeight: 1
    color: QoolStyle.textColor
    opacity: 0.6
  }
  padding: 0
  topPadding: 1
  bottomPadding: topPadding
  leftPadding: 5
  rightPadding: leftPadding
}
