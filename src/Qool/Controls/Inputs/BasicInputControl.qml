import QtQuick 2.14
import Qool.Controls 1.0
import Qool.Components 1.0
import Qool.Styles 1.0

QoolControl {
  property string description
  property bool animationEnabled: true
  implicitHeight: 45
  implicitWidth: 200

  showTitle: true
  alterBackgroundColor: false
  extraContentPadding: 2

  property color dynamicStrokeColor: hovered ? QoolStyle.highlightColor : QoolStyle.backgroundStrokeColor
  backBox.strokeColor: dynamicStrokeColor
  Behavior on dynamicStrokeColor {
    enabled: animationEnabled
    ColorAnimation {
      duration: 200
    }
  }

  ControlLockedCover {
    z: 90
    text: qsTr("× 已锁定 ×")
    backColor: QoolStyle.negativeColor
    onVisibleChanged: {
      checkup()
    }
    function checkup() {
      backBox.opacity = visible ? 0.6 : 1
      contentItem.opacity = visible ? 0.8 : 1
    }
    Component.onCompleted: checkup()
    anchors.centerIn: parent
  }
}
