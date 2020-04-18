import QtQuick 2.14
import Qool.Styles 1.0
import Qool.Components 1.0

QoolAbstractButton {
  id: control

  implicitHeight: contentItem.implicitHeight + topPadding + bottomPadding
  implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding

  contentItem: Text {
    id: mainText
    text: control.text
    font: control.font
//    leftPadding: backBox.showTitle ? 0 : backBox.cutSize
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
    anchors.left: contentItem.left
    anchors.bottom: contentItem.bottom
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
    anchors.bottom: contentItem.bottom
    anchors.right: contentItem.right
    Behavior on opacity {
      enabled: animationEnabled
      NumberAnimation {
        duration: 300
      }
    }
  }
}
