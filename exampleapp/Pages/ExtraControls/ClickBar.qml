import QtQuick 2.14
import Qool.Styles 1.0
import Qool.Controls 1.0

Rectangle {
  id: root
  color: QoolStyle.controlBackgroundColor2
  height: 14
  width: 100

  property real progress: 0
  property alias title: tt.text

  Text {
    id: tt
    anchors.centerIn: parent
    color: QoolStyle.textColor
    fontSizeMode: Text.VerticalFit
    horizontalAlignment: Qt.AlignHCenter
    verticalAlignment: Qt.AlignVCenter
    font.pixelSize: parent.height - 2
  }

  Item {
    height: root.height
    width: parent.width * progress
    clip: true
    Rectangle {
      id: highlightBar
      x: 0
      y: 0
      color: QoolStyle.highlightColor
      height: root.height
      width: root.width
    }
    Text {
      id: tt2
      text: tt.text
      anchors.centerIn: highlightBar
      color: QoolStyle.controlBackgroundColor
      fontSizeMode: Text.VerticalFit
      horizontalAlignment: Qt.AlignHCenter
      verticalAlignment: Qt.AlignVCenter
      font.pixelSize: parent.height - 2
    }
  }

  MouseArea {
    acceptedButtons: Qt.LeftButton
    anchors.fill: parent
    onClicked: progress = mouseX / width
    z: 90
    hoverEnabled: true
    onEntered: tooltip.showing_event()
    onExited: tooltip.closing_event()
  }

  Behavior on progress {
    NumberAnimation {}
  }

  QoolToolTip {
    id: tooltip
    text: qsTr("单击以设置%1").replace("%1", root.title)
    handleMouseHover: false
  }
}
