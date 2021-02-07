import QtQuick 2.14
import Qool.Components 1.0
import Qool.Styles 1.0

Item {
  id: root

  property string originalTimecode: ""

  property color color: QoolStyle.warningColor
  property color strokeColor: QoolStyle.textColor

  Row {
    anchors.right: parent.right
    anchors.top: parent.top

    DigitalNumber {
      id: num0
      partColor: root.color
      partStrokeColor: root.strokeColor
      text: originalTimecode.charAt(0)
    }

    DigitalNumber {
      id: num1
      partColor: root.color
      partStrokeColor: root.strokeColor
      text: originalTimecode.charAt(1)
    }

    DigitalNumber {
      id: num2
      partColor: root.color
      partStrokeColor: root.strokeColor
      text: originalTimecode.charAt(2)
    }

    DigitalNumber {
      id: num3
      partColor: root.color
      partStrokeColor: root.strokeColor
      text: originalTimecode.charAt(3)
    }

    DigitalNumber {
      id: num4
      partColor: root.color
      partStrokeColor: root.strokeColor
      text: originalTimecode.charAt(4)
    }

    DigitalNumber {
      id: num5
      partColor: root.color
      partStrokeColor: root.strokeColor
      text: originalTimecode.charAt(5)
    }

    DigitalNumber {
      id: num6
      partColor: root.color
      partStrokeColor: root.strokeColor
      text: originalTimecode.charAt(6)
    }

    DigitalNumber {
      id: num7
      partColor: root.color
      partStrokeColor: root.strokeColor
      text: originalTimecode.charAt(7)
    }
  } //row

  Timer {
    id: timer
    interval: 50
  }

  function time_to_code(time) {}
}
