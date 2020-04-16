import QtQuick 2.14
import Qool.Styles 1.0
import Qool.Components 1.0

QoolAbstractButton {
  id: control

  implicitHeight: 50
  implicitWidth: mainText.implicitWidth + leftPadding + rightPadding

  contentItem: Text {
    id: mainText
    text: control.text
    font: control.font
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    color: enabled ? (checked ? QoolStyle.highlightColor : QoolStyle.textColor) : QoolStyle.warningColor

    Behavior on color {
      enabled: animationEnabled
      ColorAnimation {
        duration: 300
      }
    }
  }

  SmallIndicator {
    id: checkerIndicator
    anchors.left: mainText.left
    anchors.bottom: mainText.bottom
    text: control.checked ? qsTr("已选") : qsTr("可选")
    visible: control.checkable
    backColor: control.checked ? QoolStyle.highlightColor : QoolStyle.textColor
    anchors.margins: 3
    Behavior on backColor {
      enabled: animationEnabled
      ColorAnimation {
        duration: 300
      }
    }
  }

  ControlLockedCover {
    id: lockedCover
    anchors.bottom: mainText.bottom
    anchors.right: mainText.right
    Behavior on opacity {
      enabled: animationEnabled
      NumberAnimation {
        duration: 300
      }
    }
  }
}
