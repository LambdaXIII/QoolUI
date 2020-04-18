import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14
import Qool.Styles 1.0
import Qool.Components 1.0

Window {

  id: root

  signal accepted
  signal canceled

  minimumHeight: backgroundBox.cutSize + resizeIndicator.height + 20
  minimumWidth: backgroundBox.cutSize + resizeIndicator.width + 20

  width: 500
  height: 400

  modality: Qt.WindowModal
  flags: Qt.CustomizeWindowHint | Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.Dialog
  color: "transparent"

  property bool showToolBar: true
  property bool resizable: true
  property real spacing: 5

  property real topSpace: backgroundBox.contentTopSpace + spacing
  property real leftSpace: backgroundBox.strokeWidth + 10
  property real rightSpace: Math.max(leftSpace,
                                     root.resizable ? resizeIndicator.width : 0)
  property real bottomSpace: backgroundBox.strokeWidth + 10

  property alias hiddenBox: hiddenBox
  property alias toolBarRow: toolBarRow

  property alias hasOKButton: okButton.visible
  property alias hasCancelButton: cancelButton.visible

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
          root.width = Math.max(root.width + offsetX, root.minimumWidth)
          root.height = Math.max(root.height + offsetY, root.minimumHeight)
          isFreeToResize = true
        }
      }
    }
  } //resizeIndicator

  Item {
    id: hiddenBox
    visible: false
    anchors.fill: parent
    anchors.topMargin: topSpace
    anchors.leftMargin: leftSpace
    anchors.rightMargin: rightSpace
    anchors.bottomMargin: bottomSpace + (root.showToolBar ? (toolBar.height + root.spacing) : 0)

    z: -90
  }

  Control {
    id: toolBar
    visible: root.showToolBar
    z: 50
    anchors.bottom: parent.bottom
    anchors.bottomMargin: root.bottomSpace
    anchors.left: parent.left
    anchors.leftMargin: root.leftSpace
    anchors.right: parent.right
    anchors.rightMargin: root.rightSpace
    contentItem: Row {
      id: toolBarRow
      spacing: 2
      layoutDirection: Qt.RightToLeft
      QoolDialogButton {
        id: okButton
        text: qsTr("就这样吧")
        onClicked: {
          root.accepted()
          root.close()
        }
        highlightColor: QoolStyle.positiveColor
      }
      QoolDialogButton {
        id: cancelButton
        text: qsTr("还是算了")
        onClicked: {
          root.canceled()
          root.close()
        }
        highlightColor: QoolStyle.negativeColor
      }
    }
  } //toolBar
}
