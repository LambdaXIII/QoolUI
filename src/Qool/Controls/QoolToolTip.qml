import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Controls 1.0
import QtQuick.Window 2.14

MouseArea {
  id: area

  hoverEnabled: handleMouseHover
  acceptedButtons: Qt.NoButton

  propagateComposedEvents: true

  property string text: qsTr("工具提示")
  property int openInterval: 2000
  property int closeInterval: 1000
  property QtObject attachedObject: area //默认附着位置
  property bool handleMouseHover: true //是否亲自处理鼠标事件

  anchors.fill: parent

  Connections {
    enabled: handleMouseHover
    function onEntered() {
      showing_event()
    }
    function onExited() {
      closing_event()
    }
  }

  z: 90

  function showing_event() {
    //启动显示过程的方法，默认绑定到鼠标enter
    if (text !== "") {
      let i = QoolToolTipWindow.openInterval
      if (i !== area.openInterval)
        QoolToolTipWindow.openInterval = area.openInterval
      QoolToolTipWindow.want_to_show(attachedObject.mapToGlobal(
                                       attachedObject.x,
                                       attachedObject.y - 5), text)
    }
  }

  function closing_event() {
    //启动关闭过程的方法，默认绑定到鼠标exited
    let i = QoolToolTipWindow.closeInterval
    if (i !== area.closeInterval)
      QoolToolTipWindow.closeInterval = i
    QoolToolTipWindow.want_to_close()
  }

  Component.onCompleted: {
    if (QoolToolTipWindow.transientParent == null)
      QoolToolTipWindow.transientParent = Window.window
  }
}
