import QtQuick 2.14
import Qool.Controls 1.0
import Qool.Components 1.0

QoolControl {
  property string description
  implicitHeight: 45
  implicitWidth: 200

  showTitle: true
  alterBackgroundColor: false
  extraContentPadding: 2

  ControlLockedCover {
    z: 90
    onVisibleChanged: {
      checkup()
    }
    function checkup() {
      backBox.opacity = visible ? 0.6 : 1
      contentItem.opacity = visible ? 0.8 : 1
    }
    Component.onCompleted: checkup()
  }
}
