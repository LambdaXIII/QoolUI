import QtQuick 2.14
import QtQuick.Window 2.14
import Qool.Styles 1.0
import Qool.Components 1.0

Window {

  id: root

  modality: Qt.WindowModal
  flags: Qt.CustomizeWindowHint | Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.Dialog
  color: "transparent"

  property bool resizable: true

  property real topSpace: backgroundBox.contentTopSpace
  property real leftSpace: backgroundBox.strokeWidth + 10
  property real rightSpace: Math.max(leftSpace, resizeIndicator.width)
  property real bottomSpace: backgroundBox.strokeWidth + 10

  property alias hiddenBox: hiddenBox
  Item {
    id: hiddenBox
    visible: false
    anchors.fill: parent
    anchors.topMargin: topSpace
    anchors.leftMargin: leftSpace
    anchors.rightMargin: rightSpace
    anchors.bottomMargin: bottomSpace
    z: -90
  }

  function open() {
    show()
  }

  CutCornerControlBack {
    id: backgroundBox
    title: root.title
    anchors.fill: parent
    cutSize: QoolStyle.dialogCutSize
    titleText.font.pixelSize: QoolStyle.dialogTitleFontPixelSize
    z: -99
    strokeColor: root.active ? QoolStyle.tooltipColor : QoolStyle.backgroundStrokeColor
    backColor: QoolStyle.backgroundColor
    DragMoveArea {
      anchors.fill: parent
      containmentMask: backgroundBox
      property bool canMove: true
      onWantToMove: {
        if (canMove) {
          canMove = false
          root.x = root.x + offsetX
          root.y = root.y + offsetY
          canMove = true
        }
      }
    }
  } //backgroundBox

  Canvas {
    id: resizeIndicator
    visible: root.resizable
    width: 20
    height: 20
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    onPaint: {
      var c = getContext("2d")
      c.moveTo(width, 0)
      c.lineTo(width, height)
      c.lineTo(0, height)
      c.closePath()
      c.fillStyle = backgroundBox.strokeColor
      c.fill()
    }
    DragMoveArea {
      anchors.fill: parent
      property bool isFreeToResize: true
      onWantToMove: {
        if (isFreeToResize) {
          isFreeToResize = false
          root.width += offsetX
          root.height += offsetY
          isFreeToResize = true
        }
      }
    }
  } //resizeIndicator
}
