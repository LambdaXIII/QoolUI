import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Styles 1.0
import Qool.Components 1.0

MenuItem {
  id: control

  font.pixelSize: QoolStyle.menuTextFontPixelSize

  property real itemHeight
  property real itemWidth

  ControlLockedCover {
    z: 30
  }

  CutCornerHighlightCover {
    cutSize: QoolStyle.menuCutSize
    visible: down
    hasStroke: false
  }

  arrow: Rectangle {
    x: parent.width - width
    anchors.verticalCenter: contentItem.verticalCenter
    opacity: 0.8
    visible: control.subMenu
    implicitHeight: contentItem.height
    implicitWidth: 5
    color: QoolStyle.highlightColor
  }

  indicator: SmallIndicator {
    visible: control.checkable
    text: checked ? qsTr("已选") : qsTr("可选")
    backColor: checked ? QoolStyle.highlightColor : QoolStyle.textColor
    x: parent.width - width - 2
    anchors.verticalCenter: contentItem.verticalCenter
  }

  contentItem: Text {
    //    leftPadding: control.indicator.width
    rightPadding: Math.max(control.arrow.width, control.indicator.width)
    text: control.text
    font: control.font
    color: control.highlighted ? QoolStyle.highlightColor : QoolStyle.textColor
    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight
    opacity: control.enabled ? 1 : 0.2
  }

  background: Rectangle {
    width: contentItem.width
    height: 2
    color: control.highlighted ? QoolStyle.highlightColor : "transparent"
    anchors.bottomMargin: -4
    anchors.bottom: contentItem.bottom
    anchors.horizontalCenter: contentItem.horizontalCenter
  }
}
