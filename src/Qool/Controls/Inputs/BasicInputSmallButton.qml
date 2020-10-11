import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Styles 1.0

AbstractButton {
  id: control
  property bool animationEnabled: true
  font.pixelSize: QoolStyle.tooltipTextFontPixelSize
  padding: 3
  contentItem: Text {
    text: control.text
    font: control.font
    color: down ? QoolStyle.backgroundColor : (checkable
                                               && checked) ? QoolStyle.highlightColor : QoolStyle.backgroundStrokeColor
    Behavior on color {
      enabled: control.animationEnabled
      ColorAnimation {
        duration: 100
      }
    }
  }

  background: Rectangle {
    radius: 3
    border.width: 1
    border.color: hovered ? QoolStyle.highlightColor : "transparent"
    color: down ? QoolStyle.highlightColor : "transparent"

    Behavior on color {
      enabled: control.animationEnabled
      ColorAnimation {
        duration: 100
      }
    }

    Behavior on border.color {
      enabled: control.animationEnabled
      ColorAnimation {
        duration: 100
      }
    }
  }
}
