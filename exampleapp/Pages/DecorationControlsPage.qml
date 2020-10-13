import QtQuick 2.14
import QtQuick.Controls 2.14
import Qool.Controls.Decorations 1.0
import Qool.Controls.Inputs 1.0
import Qool.Controls 1.0
import Qool.Styles 1.0
import QtQuick.Layouts 1.15

ExpPage {
  pageTitle: qsTr("QoolUI 一些装饰性控件展示")

  QtObject {
    id: props
    property real speed: -10
    property real width: 150
    property real space: 50
    property real interval: 1000 / 25
    property bool running: true
    property color color: QoolStyle.textColor
    Behavior on width {
      NumberAnimation {}
    }
    Behavior on color {
      ColorAnimation {
        duration: 500
      }
    }
  } //props

  Column {
    spacing: 15
    anchors.centerIn: parent

    QoolControl {
      id: scroller1
      height: 35
      width: props.width
      anchors.right: parent.right
      backBox.backColor: "#2b2b2b"
      leftPadding: 5
      rightPadding: 5
      title: qsTr("循环型滚动文本")
      contentItem: QoolHorizontalScrollText {
        enableMovements: props.running
        speed: props.speed
        color: props.color
        spacing: props.space
        updateInterval: props.interval
        text: qsTr("此为循环型滚动文本，只在宽度不够时开始滚动。速度和刷新时间可以自行设置。")
      } //contentItem:
    } // Scroller 1

    QoolControl {
      id: scroller2
      height: 35
      width: props.width
      anchors.right: parent.right
      backBox.backColor: "#2b2b2b"
      leftPadding: 5
      rightPadding: 5
      title: qsTr("循环型滚动文本")
      contentItem: QoolCharScrollText {
        enableMovements: props.running
        color: props.color
        updateInterval: props.interval
        text: qsTr("此为单字符滚动文本，每次刷新一个字符。空格需要自行添加          ")
      } //contentItem:
    } // Scroller 2

    QoolControl {
      id: controller
      title: qsTr("属性控制器")
      width: 320
      height: 150
      alterBackgroundColor: false
      leftPadding: 2

      ButtonGroup {
        id: intervalGroup
      }

      ButtonGroup {
        id: speedGroup
      }
      ButtonGroup {
        id: widthGroup
      }
      ButtonGroup {
        id: spacingGroup
      }
      ButtonGroup {
        id: colorGroup
      }

      contentItem: GridLayout {
        columns: 7
        rowSpacing: 0
        //暂停按钮
        BasicInputSmallButton {
          text: checked ? qsTr("正在滚动...") : qsTr("滚动暂停了...")
          checkable: true
          checked: true
          onToggled: props.running = checked
          Layout.alignment: Qt.AlignHCenter
          Layout.columnSpan: 7
        }

        //刷新间隔
        Text {
          text: qsTr("刷新率")
          color: QoolStyle.textColor
          font.pixelSize: 10
          Layout.alignment: Qt.AlignVCenter
        }

        BasicInputSmallButton {
          property real sp: 40
          text: sp + "ms"
          checkable: true
          ButtonGroup.group: intervalGroup
          onClicked: props.interval = sp
          QoolToolTip {
            text: qsTr("将移动刷新间隔设置为%1毫秒").replace("%1", parent.sp)
          }
        }
        BasicInputSmallButton {
          property real sp: 60
          text: sp + "ms"
          checkable: true
          ButtonGroup.group: intervalGroup
          onClicked: props.interval = sp
          QoolToolTip {
            text: qsTr("将移动刷新间隔设置为%1毫秒").replace("%1", parent.sp)
          }
        }
        BasicInputSmallButton {
          property real sp: 120
          text: sp + "ms"
          checkable: true
          ButtonGroup.group: intervalGroup
          onClicked: props.interval = sp
          QoolToolTip {
            text: qsTr("将移动刷新间隔设置为%1毫秒").replace("%1", parent.sp)
          }
        }
        BasicInputSmallButton {
          property real sp: 500
          text: sp + "ms"
          checkable: true
          ButtonGroup.group: intervalGroup
          onClicked: props.interval = sp
          QoolToolTip {
            text: qsTr("将移动刷新间隔设置为%1毫秒").replace("%1", parent.sp)
          }
        }
        BasicInputSmallButton {
          property real sp: 1000
          text: sp + "ms"
          checkable: true
          ButtonGroup.group: intervalGroup
          onClicked: props.interval = sp
          QoolToolTip {
            text: qsTr("将移动刷新间隔设置为%1毫秒").replace("%1", parent.sp)
          }
        }
        BasicInputSmallButton {
          property real sp: 2000
          text: sp + "ms"
          checkable: true
          ButtonGroup.group: intervalGroup
          onClicked: props.interval = sp
          QoolToolTip {
            text: qsTr("将移动刷新间隔设置为%1毫秒").replace("%1", parent.sp)
          }
        }

        //速度行
        Text {
          text: qsTr("速度")
          color: QoolStyle.textColor
          font.pixelSize: 10
          Layout.alignment: Qt.AlignVCenter
        }

        BasicInputSmallButton {
          property real sp: -30
          text: sp + "p/s"
          checkable: true
          ButtonGroup.group: speedGroup
          onClicked: props.speed = sp
          QoolToolTip {
            text: qsTr("将移动速度设置为%1点每秒").replace("%1", parent.sp)
          }
        }
        BasicInputSmallButton {
          property real sp: -10
          text: sp + "p/s"
          checkable: true
          ButtonGroup.group: speedGroup
          onClicked: props.speed = sp
          checked: true
          QoolToolTip {
            text: qsTr("将移动速度设置为%1点每秒").replace("%1", parent.sp)
          }
        }
        BasicInputSmallButton {
          property real sp: -5
          text: sp + "p/s"
          checkable: true
          ButtonGroup.group: speedGroup
          onClicked: props.speed = sp
          QoolToolTip {
            text: qsTr("将移动速度设置为%1点每秒").replace("%1", parent.sp)
          }
        }
        BasicInputSmallButton {
          property real sp: 5
          text: sp + "p/s"
          checkable: true
          ButtonGroup.group: speedGroup
          onClicked: props.speed = sp
          QoolToolTip {
            text: qsTr("将移动速度设置为%1点每秒").replace("%1", parent.sp)
          }
        }
        BasicInputSmallButton {
          property real sp: 10
          text: sp + "p/s"
          checkable: true
          ButtonGroup.group: speedGroup
          onClicked: props.speed = sp
          QoolToolTip {
            text: qsTr("将移动速度设置为%1点每秒").replace("%1", parent.sp)
          }
        }
        BasicInputSmallButton {
          property real sp: 30
          text: sp + "p/s"
          checkable: true
          ButtonGroup.group: speedGroup
          onClicked: props.speed = sp
          QoolToolTip {
            text: qsTr("将移动速度设置为%1点每秒").replace("%1", parent.sp)
          }
        }

        //尺寸行
        Text {
          text: qsTr("宽度")
          color: QoolStyle.textColor
          font.pixelSize: 10
          Layout.alignment: Qt.AlignVCenter
        }

        BasicInputSmallButton {
          property real sp: 100
          text: sp + "px"
          checkable: true
          ButtonGroup.group: widthGroup
          onClicked: props.width = sp
          QoolToolTip {
            text: qsTr("将控件宽度调整为%1像素").replace("%1", parent.sp)
          }
          Layout.columnSpan: 2
          Layout.alignment: Qt.AlignHCenter
        }
        BasicInputSmallButton {
          property real sp: 150
          text: sp + "px"
          checkable: true
          ButtonGroup.group: widthGroup
          onClicked: props.width = sp
          QoolToolTip {
            text: qsTr("将控件宽度调整为%1像素").replace("%1", parent.sp)
          }
          Layout.columnSpan: 2
          checked: true
          Layout.alignment: Qt.AlignHCenter
        }
        BasicInputSmallButton {
          property real sp: 320
          text: sp + "px"
          checkable: true
          ButtonGroup.group: widthGroup
          onClicked: props.width = sp
          QoolToolTip {
            text: qsTr("将控件宽度调整为%1像素").replace("%1", parent.sp)
          }
          Layout.columnSpan: 2
          Layout.alignment: Qt.AlignHCenter
        }

        //间距控制
        Text {
          text: qsTr("间距")
          color: QoolStyle.textColor
          font.pixelSize: 10
          Layout.alignment: Qt.AlignVCenter
        }
        BasicInputSmallButton {
          property real sp: 0
          text: sp + "px"
          checkable: true
          ButtonGroup.group: spacingGroup
          onClicked: props.space = sp
          QoolToolTip {
            text: qsTr("将重复间距调整为%1像素").replace("%1", parent.sp)
          }
          Layout.alignment: Qt.AlignHCenter
          Layout.columnSpan: 2
        }

        BasicInputSmallButton {
          property real sp: 50
          text: sp + "px"
          checkable: true
          ButtonGroup.group: spacingGroup
          onClicked: props.space = sp
          QoolToolTip {
            text: qsTr("将重复间距调整为%1像素").replace("%1", parent.sp)
          }
          Layout.alignment: Qt.AlignHCenter
          Layout.columnSpan: 2
          checked: true
        }
        BasicInputSmallButton {
          property real sp: 150
          text: sp + "px"
          checkable: true
          ButtonGroup.group: spacingGroup
          onClicked: props.space = sp
          QoolToolTip {
            text: qsTr("将重复间距调整为%1像素").replace("%1", parent.sp)
          }
          Layout.alignment: Qt.AlignHCenter
          Layout.columnSpan: 2
        }

        //颜色行
        Text {
          text: qsTr("颜色")
          color: QoolStyle.textColor
          font.pixelSize: 10
          Layout.alignment: Qt.AlignVCenter
          Layout.rowSpan: 2
        }
        BasicInputSmallButton {
          property color sp: QoolStyle.textColor
          checkable: true
          padding: 2
          contentItem: Rectangle {
            radius: 2
            color: parent.sp
            clip: true
            Text {
              text: qsTr("选")
              color: "black"
              font.pixelSize: 15
              anchors.centerIn: parent
              visible: parent.parent.checked
            }
          }
          ButtonGroup.group: colorGroup
          onClicked: props.color = sp

          Layout.alignment: Qt.AlignHCenter
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.maximumHeight: 12
          Layout.columnSpan: 2
        }
        BasicInputSmallButton {
          property color sp: QoolStyle.highlightColor
          checkable: true
          padding: 2
          contentItem: Rectangle {
            radius: 2
            color: parent.sp
            clip: true
            Text {
              text: qsTr("选")
              color: "black"
              font.pixelSize: 15
              anchors.centerIn: parent
              visible: parent.parent.checked
            }
          }
          ButtonGroup.group: colorGroup
          onClicked: props.color = sp

          Layout.alignment: Qt.AlignHCenter
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.maximumHeight: 12
          Layout.columnSpan: 2
        }
        BasicInputSmallButton {
          property color sp: QoolStyle.positiveColor
          checkable: true
          padding: 2
          contentItem: Rectangle {
            radius: 2
            color: parent.sp
            clip: true
            Text {
              text: qsTr("选")
              color: "black"
              font.pixelSize: 15
              anchors.centerIn: parent
              visible: parent.parent.checked
            }
          }
          ButtonGroup.group: colorGroup
          onClicked: props.color = sp

          Layout.alignment: Qt.AlignHCenter
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.maximumHeight: 12
          Layout.columnSpan: 2
        }
        BasicInputSmallButton {
          property color sp: QoolStyle.negativeColor
          checkable: true
          padding: 2
          contentItem: Rectangle {
            radius: 2
            color: parent.sp
            clip: true
            Text {
              text: qsTr("选")
              color: "black"
              font.pixelSize: 15
              anchors.centerIn: parent
              visible: parent.parent.checked
            }
          }
          ButtonGroup.group: colorGroup
          onClicked: props.color = sp

          Layout.alignment: Qt.AlignHCenter
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.maximumHeight: 12
          Layout.columnSpan: 2
        }
        BasicInputSmallButton {
          property color sp: QoolStyle.tooltipColor
          checkable: true
          padding: 2
          contentItem: Rectangle {
            radius: 2
            color: parent.sp
            clip: true
            Text {
              text: qsTr("选")
              color: "black"
              font.pixelSize: 15
              anchors.centerIn: parent
              visible: parent.parent.checked
            }
          }
          ButtonGroup.group: colorGroup
          onClicked: props.color = sp

          Layout.alignment: Qt.AlignHCenter
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.maximumHeight: 12
          Layout.columnSpan: 2
        }
        BasicInputSmallButton {
          property color sp: QoolStyle.infoColor
          checkable: true
          padding: 2
          contentItem: Rectangle {
            radius: 2
            color: parent.sp
            clip: true
            Text {
              text: qsTr("选")
              color: "black"
              font.pixelSize: 15
              anchors.centerIn: parent
              visible: parent.parent.checked
            }
          }
          ButtonGroup.group: colorGroup
          onClicked: props.color = sp

          Layout.alignment: Qt.AlignHCenter
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.maximumHeight: 12
          Layout.columnSpan: 2
        }
      } //content grid
    }
  } //Column
}
