pragma Singleton

import QtQuick 2.0

QtObject {
  id: coolStyle


  /*
  property color backgroundColor: "#1c1c1c"
  property color backgroundStrokeColor: "#979797"
  property color warningColor: "#e23e2c"
  property color indicatorColor:"#ff8d00"
  property color greenColor:"#c79900"
  property color highlightColor: "orange"
  property color controlBackgroundColor: "#2b2b2b"
  property color controlBackgroundColor2: "#101010"
  property color textColor: "#cfcfcf"
  property color disabledColor: "#636363"
*/
  property color backgroundColor: "#282a36"
  property color controlBackgroundColor: "#343646"
  property color controlBackgroundColor2: "#131419"
  property color foregroundColor: "#f8f8f2"
  property color commentColor: "#6272a4"

  property color infoColor: "#8be9fd"
  property color positiveColor: "#50fa7b"
  property color highlightColor: "#ffb86c"
  property color warningColor: "#ff79c6"
  property color negativeColor: "#ff5555"

  property color purpleColor: "#bd93f9"
  property color yellowColor: tooltipColor

  property real windowCutSize: 40
  property real controlCutSize: 10
  property real buttonCutSize: 5
  property real menuCutSize: 5

  property color textColor: foregroundColor
  property color backgroundStrokeColor: "#a49ca5"
  property color tooltipColor: "#f1fa8c"

  property real menuBarFontPixelSize: 14
  property real menuTextFontPixelSize: 12
}
