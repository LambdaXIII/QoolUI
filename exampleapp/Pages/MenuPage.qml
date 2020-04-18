import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Controls 1.0

ExpPage {

  pageTitle: qsTr("菜单效果展示")

  QoolMenuBar {
    x: (parent.width - width) / 2
    y: 10
    width: parent.width * 0.8
    QoolMenu {
      title: qsTr("菜单1")
      Action {
        text: qsTr("项目1")
        checkable: true
      }
      Action {
        text: qsTr("项目2")
      }
      QoolMenuBanner {
        text: qsTr("简单的说明文字")
      }

      QoolMenu {
        title: qsTr("紫菜单")
        QoolMenuBanner {
          text: qsTr("另一种颜色的说明文字")
          alterColor: true
        }

        Action {
          text: qsTr("项目3")
        }
        QoolMenuSeparator {}
        Action {
          text: qsTr("项目4")
        }
      }
    } //menu1
    QoolMenu {
      title: qsTr("菜单2")
      QoolMenuBanner {
        text: qsTr("这些选项类似 RadioButton\n只能选择一个")
      }
      ActionGroup {
        id: group
      }
      Action {
        text: qsTr("喝咖啡")
        checkable: true
        ActionGroup.group: group
      }
      Action {
        text: qsTr("喝茶")
        checkable: true
        ActionGroup.group: group
      }
      Action {
        text: qsTr("喝酒")
        checkable: true
        ActionGroup.group: group
      }
    } //menu2
  } //menubar

  QoolControl {
    width: 200
    height: 50
    anchors.centerIn: parent
    alterBackgroundColor: false
    titleText.visible: false
    contentItem: Text {
      text: qsTr("右键点击激活上下文菜单")
      color: "white"
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
    }
    MouseArea {
      anchors.fill: parent
      acceptedButtons: Qt.RightButton
      onClicked: cmenu.popup()
    }
  }

  QoolMenu {
    id: cmenu
    title: qsTr("右键菜单")
    showTitle: showTitleAction.checked
    QoolMenuBanner {
      text: qsTr("通过设置showTitle属性，可以调整菜单形状。但是刷新有些问题，所以请不要动态修改它。")
      alterColor: true
    }
    Action {
      id: showTitleAction
      text: checked ? qsTr("显示菜单标题") : qsTr("隐藏菜单标题")
      checkable: true
      checked: true
    }
    QoolMenuSeparator {}
    Action {
      text: qsTr("另一个没用的选项")
    }
  }
}
