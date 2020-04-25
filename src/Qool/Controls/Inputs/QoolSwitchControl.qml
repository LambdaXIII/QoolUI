import QtQuick 2.14
import Qool.Styles 1.0

BasicInputControl {
  id: control

  signal switched(int index)

  property var tags: []
  property int currentIndex: 0
  readonly property string value: currentIndex < tags.length ? tags[currentIndex] : ""
  property int defaultIndex: 0
  function resetValue() {
    currentIndex = defaultIndex
  }

  contentItem: Item {
    Item {
      x: 2
      height: parent.height
      width: 4
      Rectangle {
        anchors.fill: parent
        border.width: 1
        border.color: QoolStyle.backgroundStrokeColor
        color: "transparent"
        opacity: 0.5
      }
      Rectangle {
        width: parent.width
        color: enabled ? QoolStyle.highlightColor : QoolStyle.negativeColor
        border.width: 0
        height: tags.length == 0 ? parent.height : parent.height / tags.length
        y: currentIndex * height
        Behavior on y {
          enabled: control.animationEnabled
          SmoothedAnimation {
            duration: 200
          }
        }
        opacity: 0.6
      }
    }

    Text {
      id: mainText
      text: value
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
