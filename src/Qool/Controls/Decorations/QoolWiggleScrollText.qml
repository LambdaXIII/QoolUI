import QtQuick 2.14
import Qool.Styles 1.0

Item {

  id: root

  clip: true
  property string text
  property color color: QoolStyle.textColor
  property font font

  property real updateInterval: 1000 / 25
  property real speed: 10

  property bool enableMovements: true

  property int alignment: Qt.AlignLeft

  height: innerText.height
  width: innerText.width

  QtObject {
    id: intProps
    function default_x() {
      switch (root.alignment) {
      case Qt.AlignHCenter:
        return (root.width - innerText.width) / 2
      case Qt.AlignRight:
        return (root.width - innerText.width)
      default:
        return 0
      }
    } //function
  }

  Text {
    id: innerText
    text: root.text
    color: root.color
    font: root.font
    x: intProps.default_x()
  }

  Timer {
    id: timer
    repeat: true
    interval: root.updateInterval
    running: root.enableMovements
    property real deltaValue: Math.abs(root.speed) / 1000 * interval
    property bool movingRight: true
    onTriggered: {
      if (innerText.x >= root.width - innerText.width)
        movingRight = false
      if (innerText.x <= 0)
        movingRight = true

      if (movingRight)
        innerText.x += deltaValue
      else
        innerText.x -= deltaValue
    }
  }

  function reset() {
    innerText.x = intProps.default_x()
  }
}
