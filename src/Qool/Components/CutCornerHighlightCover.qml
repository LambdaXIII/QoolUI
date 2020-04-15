import QtQuick 2.14
import Qool.Styles 1.0

CutCornerBox {
  id: root

  property var words: [qsTr("啪!"), qsTr("啪啪!"), qsTr("啪啪啪"), qsTr("啪!!")]

  property color highColor: QoolStyle.highlightColor
  property color lowColor: QoolStyle.backgroundColor

  clip: true
  z: 90

  anchors.fill: parent

  backColor: highColor
  strokeColor: highColor

  Text {
    z: 1
    id: highlightWord
    color: root.lowColor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    font.pixelSize: root.height / 2
    font.bold: true
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
  }

  function updateWordPosition() {
    highlightWord.anchors.verticalCenterOffset = Math.random(
          ) * (root.height / 2) - root.height / 4
    highlightWord.anchors.horizontalCenterOffset = Math.random(
          ) * (root.width / 2) - root.width / 4
    highlightWord.rotation = -45 + Math.random() * 90
    highlightWord.scale = Math.random() + 1
    highlightWord.text = root.words[Math.floor(Math.random(
                                                 ) * root.words.length)]
  }

  Component.onCompleted: updateWordPosition()
  onVisibleChanged: if (!visible)
                      updateWordPosition()
}
