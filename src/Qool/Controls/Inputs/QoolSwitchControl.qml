import QtQuick 2.14
import Qool.Styles 1.0

BasicInputControl {
  id: control

  signal switched(int index)

  property var tags: []
  property int currentIndex: 0
  property string currentValue: currentIndex < tags.length ? tags[currentIndex] : ""

  contentItem: Item {
    Rectangle {
      height: parent.height
      width: 8
      border.width: 1
      border.color: QoolStyle.backgroundStrokeColor
      color: enabled ? "transparent" : QoolStyle.negativeColor
      Rectangle {
        width: parent.width
        color: QoolStyle.highlightColor
        border.width: 0
        height: tags.length == 0 ? parent.height : parent.height / tags.length
        y: currentIndex * height
        Behavior on y {
          enabled: control.animationEnabled
          SmoothedAnimation {
            duration: 200
          }
        }
      }
    }

    Text {
      id: mainText
      text: currentValue
      anchors.fill: parent
      leftPadding: 4
      color: QoolStyle.textColor
      horizontalAlignment: Text.AlignRight
      verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
      acceptedButtons: Qt.LeftButton
      onClicked: switchToNext()
      anchors.fill: parent
    }
  } //contentItem:

  function switchToNext() {
    let nextIndex = currentIndex + 1
    currentIndex = nextIndex >= tags.length ? 0 : nextIndex
    switched(currentIndex)
  }
}
