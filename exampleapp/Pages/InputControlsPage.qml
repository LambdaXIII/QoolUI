import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Controls.Inputs 1.0
import Qool.Controls 1.0

ExpPage {
  pageTitle: qsTr("各种输入控件展示")

  Grid {
    //    anchors.centerIn: parent
    x: (parent.width - width) / 2
    spacing: 6
    columns: 2
    QoolTextInputControl {
      title: qsTr("文本输入框")
      value: qsTr("在此输入文本内容")
    }
    QoolTextInputControl {
      title: qsTr("禁用的文本输入框")
      value: qsTr("被禁用就没办法啦")
      enabled: false
    }
    QoolSwitchControl {
      id: switcher
      title: qsTr("多选项切换框")
      tags: ["苹果", "橘子", "香蕉", "苦瓜"]
      onSwitched: switcher2.switchToNext()
    }
    QoolSwitchControl {
      id: switcher2
      title: qsTr("锁定的多选项切换器")
      tags: ["苹果", "橘子", "香蕉", "苦瓜"]
      currentIndex: 2
      enabled: switcher.currentIndex % 2 != 0
    }

    QoolSpinControl {
      title: qsTr("超级复杂的数字输入控件")
    }

    QoolSpinControl {
      title: qsTr("被禁用的数字输入控件")
      enabled: false
      value: 48.67
    }

    QoolColorControl {
      id: colorControl
      title: qsTr("颜色选择器")
      MouseArea {
        acceptedButtons: Qt.RightButton
        hoverEnabled: false
        onClicked: colorMenu.popup()
        anchors.fill: parent
      }
      alphaEnabled: opacityAction.checked

      QoolMenu {
        id: colorMenu
        showTitle: true
        title: qsTr("颜色选择器选项")
        QoolMenuBanner {
          text: qsTr("关闭文字显示以获得最高性能\n名字模式占用资源最大")
        }

        ActionGroup {
          id: colorModeGroup
        }
        Action {
          text: qsTr("关闭文字显示")
          onTriggered: colorControl.nameType = QoolColorControl.None
          checkable: true
          checked: true
          ActionGroup.group: colorModeGroup
        }
        Action {
          text: qsTr("RGB模式")
          onTriggered: colorControl.nameType = QoolColorControl.RGB
          checkable: true
          ActionGroup.group: colorModeGroup
        }
        Action {
          text: qsTr("HSL模式")
          onTriggered: colorControl.nameType = QoolColorControl.HSL
          checkable: true
          ActionGroup.group: colorModeGroup
        }
        Action {
          text: qsTr("HSV模式")
          onTriggered: colorControl.nameType = QoolColorControl.HSV
          checkable: true
          ActionGroup.group: colorModeGroup
        }
        Action {
          text: qsTr("CMYK模式")
          onTriggered: colorControl.nameType = QoolColorControl.CMYK
          checkable: true
          ActionGroup.group: colorModeGroup
        }
        Action {
          text: qsTr("HEX模式")
          onTriggered: colorControl.nameType = QoolColorControl.HEX
          checkable: true
          ActionGroup.group: colorModeGroup
        }
        Action {
          text: qsTr("名称模式")
          onTriggered: colorControl.nameType = QoolColorControl.NAME
          checkable: true
          ActionGroup.group: colorModeGroup
        }
        Action {
          text: qsTr("激活透明度支持")
          id: opacityAction
          checkable: true
        }
      } //menu
    }

    QoolColorControl {
      title: qsTr("被禁用的颜色选择器")
      enabled: false
      nameType: QoolColorControl.NAME
      value: "red"
    }
  } //grid
}
