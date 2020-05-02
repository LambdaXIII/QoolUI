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
  property bool animationEnabled: false
  property string title
  property bool showTitle: false
  property alias titleText: backBox.titleText
  property real extraContentPadding: 0
  property color highlightColor: QoolStyle.highlightColor
  property string groupName

  signal clicked

  background: CutCornerControlBack {
    id: backBox
    title: control.title
    showTitle: control.showTitle
    cutSize: QoolStyle.buttonCutSize
    strokeWidth: 1
    strokeColor: enabled ? (mouseOvered | checked ? control.highlightColor : QoolStyle.backgroundStrokeColor) : QoolStyle.warningColor
    backColor: enabled ? QoolStyle.controlBackgroundColor : QoolStyle.controlBackgroundColor2

    Behavior on strokeColor {
      enabled: animationEnabled
      ColorAnimation {
        duration: 200
      }
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
          color: control.highlightColor
        }

        GradientStop {
          position: 0
          color: "#00000000"
        }
      }
      opacity: 0.2
      Behavior on opacity {
        enabled: animationEnabled
        NumberAnimation {
          duration: 200
        }
      }

      visible: mouseOvered
    }
  }

  leftPadding: backBox.strokeWidth + extraContentPadding
  rightPadding: backBox.strokeWidth + extraContentPadding
  bottomPadding: backBox.strokeWidth + extraContentPadding
  topPadding: backBox.strokeWidth + extraContentPadding
              + (control.showTitle ? backBox.contentTopSpace : 0)

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
    z: 31
  }

  CutCornerHighlightCover {
    visible: down
    cutSize: backBox.cutSize
  }

  onClicked: {
    if (checkable) {
      checked = !checked
    }
  }

  onCheckedChanged: QoolButtonGroupManager.switched_from_group(this, groupName)
}
