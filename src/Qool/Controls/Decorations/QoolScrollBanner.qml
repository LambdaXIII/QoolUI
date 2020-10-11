import QtQuick 2.14
import Qool.Styles 1.0

Item {

  id: root

  clip: true
  property string text
  property color color: QoolStyle.textColor
  property real spacing: 20
  property font font

  property real updateInterval: 1000 / 25
  property real speed: -15

  property bool enableMovements: true

  height: loaderA.height
  width: loaderA.width

  Component {
    id: innerText
    Text {
      text: root.text
      color: root.color
      font: root.font
    }
  }

  Loader {
    id: loaderA
    sourceComponent: innerText
    x: 0
    anchors.verticalCenter: parent.verticalCenter
  }

  Loader {
    id: loaderB
    sourceComponent: innerText
    x: loaderA.x + loaderA.width + root.spacing
    y: loaderA.y
    visible: loaderA.width > root.width
  }

  Loader {
    id: loaderC
    sourceComponent: innerText
    x: loaderA.x - loaderB.width - root.spacing
    y: loaderA.y
    visible: loaderA.width > root.width
  }

  Timer {
    id: timer
    interval: root.updateInterval
    property real deltaValue: speed / 1000 * interval
    onTriggered: {
      if (loaderA.x >= 0 + loaderA.width + root.spacing)
        loaderA.x -= (loaderA.width + root.spacing)
      if (loaderA.x <= 0 - loaderA.width - root.spacing)
        loaderA.x += (loaderA.width + root.spacing)
      loaderA.x += deltaValue
    }
    repeat: true
    running: (loaderA.width > root.width) && root.enableMovements
  }

  function reset() {
    loaderA.x = 0
  }
}
