import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Components 1.0
import Qool.Styles 1.0

Control {
  id: control

  property string text: qsTr("空白按钮")

  property alias backBox: backBox
  readonly property bool down: mouseArea.down
  readonly property bool mouseOvered: mouseArea.mouseOvered
  property bool checkable: false
  property bool checked: false

  signal clicked

  background: CutCornerBox {
    id: backBox
    cutSize: QoolStyle.controlCutSize
    strokeWidth: 2
    strokeColor: enabled ? (mouseOvered | checked ? QoolStyle.highlightColor : QoolStyle.backgroundStrokeColor) : QoolStyle.disabledColor
    backColor: QoolStyle.controlBackgroundColor
    Rectangle {
      width: 6
      height: width
      radius: width / 2
      border.width: 0
      color: checked ? QoolStyle.highlightColor : QoolStyle.textColor
      visible: checkable
      anchors.left: parent.left
      anchors.bottom: parent.bottom
      anchors.margins: 5
      z: 1
    }
    Rectangle {
      width: 6
      height: width
      radius: width / 2
      border.width: 0
      color: QoolStyle.warningColor
      visible: !enabled
      anchors.left: parent.left
      anchors.bottom: parent.bottom
      anchors.margins: 5
      z: 2
    }

    Rectangle {
      id: hoverCover
      anchors.fill: parent
      anchors.topMargin: backBox.cutSize
      anchors.leftMargin: backBox.strokeWidth
      anchors.rightMargin: backBox.strokeWidth
      anchors.bottomMargin: backBox.strokeWidth
      gradient: Gradient {
        GradientStop {
          position: 1
          color: QoolStyle.highlightColor
        }

        GradientStop {
          position: 0
          color: "#00000000"
        }
      }
      opacity: 0.2
      visible: mouseOvered
    }
  }

  leftPadding: backBox.strokeWidth
  rightPadding: backBox.strokeWidth
  bottomPadding: backBox.strokeWidth
  topPadding: backBox.strokeWidth

  MouseArea {
    id: mouseArea
    containmentMask: backBox
    anchors.fill: backBox
    hoverEnabled: true
    property bool down: false
    onPressed: down = true
    onReleased: {
      down = false
      if (backBox.contains(Qt.point(mouseX, mouseY)))
        control.clicked()
    }
    property bool mouseOvered: false
    onEntered: mouseOvered = true
    onExited: mouseOvered = false
    z: 90
  }

  CutCornerHighlightCover {
    visible: down
  }

  onClicked: {
    if (checkable) {
      checked = !checked
    }
  }
}
