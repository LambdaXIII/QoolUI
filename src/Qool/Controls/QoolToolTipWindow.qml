pragma Singleton

import QtQuick 2.14
import QtQuick.Window 2.14
import Qool.Styles 1.0

Window {
  id: root

  flags: Qt.CustomizeWindowHint | Qt.FramelessWindowHint | Qt.ToolTip | Qt.NoDropShadowWindowHint
  color: "transparent"
  opacity: 0

  title: "QoolToolTip"

  property string text
  property bool smoothPositioning: false //动态位移
  property alias openInterval: openTimer.interval //启动延迟
  property alias closeInterval: closeTimer.interval //关闭延迟

  width: tipText.width
  height: tipText.height

  Text {
    //工具提示文本
    id: tipText
    text: root.text
    color: QoolStyle.backgroundColor
    z: 20
    leftPadding: 8
    rightPadding: 8
    topPadding: 4
    bottomPadding: 4
    font.pixelSize: QoolStyle.tooltipTextFontPixelSize
  }

  Rectangle {
    //自己绘制的背景
    id: backgroundRect
    color: QoolStyle.tooltipColor
    border.width: 1
    border.color: tipText.color
    radius: 2
    anchors.fill: parent
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    onEntered: root.opacity = 0
  }

  Behavior on opacity {
    NumberAnimation {
      duration: 200
    }
  }

  Behavior on x {
    enabled: smoothPositioning
    SmoothedAnimation {
      duration: 200
    }
  }

  Behavior on y {
    enabled: smoothPositioning
    SmoothedAnimation {
      duration: 200
    }
  }

  Timer {
    //启动延迟计时器
    id: openTimer
    interval: 500
    onTriggered: opacity = 1
  }

  Timer {
    //自动关闭计时器
    id: closeTimer
    interval: 2000
    onTriggered: opacity = 0
  }

  /*显示方法*/
  function want_to_show(point, t) {
    root.text = t
    set_pos(point)
    show()
    closeTimer.stop()

    if (opacity == 0)
      openTimer.restart()
    else
      opacity = 1
  }

  //关闭方法
  function want_to_close() {
    openTimer.stop()
    if (opacity == 1)
      closeTimer.restart()
  }

  function set_pos(p) {
    let xx = p.x
    let yy = p.y - root.height
    //添加屏幕边界检查
    if (xx + root.width > Screen.desktopAvailableWidth)
      xx = Screen.desktopAvailableWidth - width
    if (yy + root.height < 0)
      yy = 0
    root.x = xx
    root.y = yy
  }
}
