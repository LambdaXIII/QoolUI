import QtQuick 2.12
import Qool.Controls 1.0
import QtQuick.Controls 2.12
import Qool.Styles 1.0

QoolControl {
  id: control
  signal pageSelected(string page)
  alterBackgroundColor: false
  PagesModel {
    id: pagesModel
  }
  titleText.text: qsTr("选择页面")

  ButtonGroup {
    id: buttonGroup
  }
  contentItem: ListView {
    model: pagesModel
    delegate: AbstractButton {
      checked: model.index === 0
      ButtonGroup.group: buttonGroup
      checkable: true
      width: parent.width
      padding: 3
      onClicked: control.pageSelected(model.page)
      contentItem: Text {
        text: model.title
        color: hovered ? QoolStyle.backgroundColor : QoolStyle.textColor
        elide: Text.ElideMiddle
        padding: 2
        Rectangle {
          border.color: hovered ? QoolStyle.backgroundColor : QoolStyle.highlightColor
          border.width: 1
          color: "transparent"
          visible: checked
          anchors.fill: parent
          radius: 2
        }
      }
      background: Rectangle {
        color: down ? QoolStyle.highlightColor : QoolStyle.backgroundStrokeColor
        visible: hovered
      }
    } //delegate
  } //contentItem: list
}
