import QtQuick 2.14
import Qool.Styles 1.0

Item {
  id: root

  clip: true

  property string text
  property color color: QoolStyle.textColor
  property font font

  property real updateInterval: 500

  property bool enableMovements: true

  height: fontmetrics.height
  width: 200

  FontMetrics {
    id: fontmetrics
    font: root.font
  }

  Text {
    id: mainText
    anchors.fill: parent
    color: root.color
  }

  Timer {
    id: timer
    interval: root.updateInterval
    property int cutIndex: 0
    property int length: root.text.length
    onTriggered: {
      let whole_text = root.text + root.text
      let new_text = whole_text.substr(cutIndex)
      mainText.text = new_text
      if (cutIndex >= length)
        cutIndex = 0
      cutIndex += 1
    }
    running: enableMovements
    repeat: true
  }
}
