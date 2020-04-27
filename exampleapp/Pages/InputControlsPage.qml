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

    QoolSpinNumberControl {
      id: spinControl
      title: qsTr("超级复杂的数字输入控件")
      keepExtraZeros: spinZeroCutAc.checked
      wheelControlEnabled: spinWheelAc.checked
      showIndicator: spinIndicatorAc.checked
      editable: spinEditAc.checked
      cycleNumber: spinCycleAc.checked
      MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        hoverEnabled: false
        onClicked: spinMenu.popup()
      }
      QoolMenu {
        id: spinMenu
        title: qsTr("数字输入选项")
        showTitle: true
        QoolMenuBanner {
          text: qsTr("使用滚轮调整大小时，\n如果数值过小，\n将会重载步进数值")
        }
        Action {
          id: spinEditAc
          checked: true
          text: qsTr("允许键盘编辑")
          checkable: true
        }
        Action {
          id: spinCycleAc
          checked: false
          text: qsTr("启用循环数值")
          checkable: true
        }
        Action {
          id: spinZeroCutAc
          checked: false
          text: qsTr("保留末尾多余的0")
          checkable: true
        }
        Action {
          id: spinWheelAc
          text: qsTr("启用滚轮调整数值")
          checkable: true
          checked: true
        }
        Action {
          id: spinIndicatorAc
          text: qsTr("显示下方范围指示器")
          checkable: true
          checked: true
        }

        QoolMenu {
          title: qsTr("设置最大值")
          Action {
            text: "10"
            onTriggered: spinControl.maxValue = 10
          }
          Action {
            text: "200"
            onTriggered: spinControl.maxValue = 200
          }
          Action {
            text: "3000"
            onTriggered: spinControl.maxValue = 3000
          }
        }
        QoolMenu {
          title: qsTr("设置最小值")
          Action {
            text: "0"
            onTriggered: spinControl.minValue = 0
          }
          Action {
            text: "50"
            onTriggered: spinControl.minValue = 50
          }
          Action {
            text: "-100"
            onTriggered: spinControl.minValue = -100
          }
        }
        QoolMenu {
          title: qsTr("设置步进数值")
          Action {
            text: "1"
            onTriggered: spinControl.stepValue = 1
          }
          Action {
            text: "10"
            onTriggered: spinControl.stepValue = 10
          }
          Action {
            text: "153"
            onTriggered: spinControl.stepValue = 153
          }
        }
        QoolMenu {
          title: qsTr("设置小数位数")
          QoolMenuBanner {
            text: qsTr("设置为0以处理整数")
          }
          Action {
            text: "0"
            onTriggered: spinControl.decimals = 0
          }
          Action {
            text: "2"
            onTriggered: spinControl.decimals = 0
          }
          Action {
            text: "4"
            onTriggered: spinControl.decimals = 0
          }
        }
      } //menu
    }

    QoolSpinNumberControl {
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

    QoolDragNumberControl {
      title: qsTr("拖拽型数字机")
      editable: false
    }
    QoolDragNumberControl {
      title: qsTr("被禁用的拖拽型数字机")
      enabled: false
      value: 56.321234
      decimals: 4
    }

    QoolCheckableControl {
      title: qsTr("逻辑型控件")
      checked: true
      text: checked ? qsTr("左边的开关显示状态") : qsTr("哎呀，快把我打开！")
    }
    QoolCheckableControl {
      title: qsTr("被禁用的逻辑型控件")
      text: qsTr("没有人可以拒绝我")
      checked: true
      disableInfo: qsTr(" - 不让改 - ")
      enabled: false
    }
  } //grid
}
