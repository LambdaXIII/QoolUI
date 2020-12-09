import QtQuick 2.12
import QtQml.Models 2.12

ListModel {
  ListElement {
    title: qsTr("欢迎页")
    page: "FrontPage.qml"
  }

  ListElement {
    title: qsTr("普通文本按钮")
    page: "QoolButtonsPage.qml"
  }
  ListElement {
    title: qsTr("按钮分组")
    page: "QoolButtonsPage_2.qml"
  }
  ListElement {
    title: qsTr("切角图框")
    page: "CutCornerBoxPage.qml"
  }
  ListElement {
    title: qsTr("菜单效果")
    page: "MenuPage.qml"
  }
  ListElement {
    title: qsTr("对话框")
    page: "DialogPage.qml"
  }
  ListElement {
    title: qsTr("输入控件")
    page: "InputControlsPage.qml"
  }
  ListElement {
    title: qsTr("工具提示")
    page: "TooltipPage.qml"
  }
  ListElement {
    title: qsTr("滚动文本控件")
    page: "ScrollTextPage.qml"
  }
  ListElement {
    title: qsTr("圆角矩形")
    page: "RoundCornerBoxPage.qml"
  }
  ListElement {
    title: qsTr("数码数字")
    page: "DigitalNumberPage.qml"
  }
}
