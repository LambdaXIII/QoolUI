import QtQuick 2.14
import Qool.Controls 1.0
import Qool.Components 1.0
import QtQuick.Controls 2.14
import Qool.Styles 1.0

ExpPage {
  pageTitle: qsTr("酷酷的工具提示")
  Column {
    anchors.centerIn: parent
    spacing: 15

    Text {
      color: QoolStyle.textColor
      text: qsTr("鼠标指向下面的控件启动工具提示")
      anchors.horizontalCenter: parent.horizontalCenter
    }

    CutCornerBox {
      width: 200
      height: 25
      imagePath: ":/assets/picture2.jpg"
      QoolToolTip {
        text: qsTr("这是一个自定义的Tooltip")
      }
      cutSize: 5
    }

    CutCornerBox {
      width: 200
      height: 25
      backColor: QoolStyle.negativeColor
      QoolToolTip {
        text: qsTr("和自带的Tooltip一样，\n可以输入多行文本，\n支持富文本;\n可以设置启动和关闭延迟")
      }
      cutSize: 5
    }

    CutCornerBox {
      width: 200
      height: 25
      backColor: QoolStyle.highlightColor
      QoolToolTip {
        text: qsTr("如果鼠标直接移动到了Tooltip上面，它会立即关闭")
      }
      cutSize: 5
    }

    CutCornerBox {
      width: 200
      height: 25
      backColor: QoolStyle.commentColor
      QoolToolTip {
        text: qsTr("同时，如果信息过多的话，这个提示是可以超过窗口范围的！但是会自动检测是否超过了屏幕范围，如果超出了就会调整位置。")
      }
      cutSize: 5
    }

    QoolRadioButton {
      text: checked ? qsTr("激活动态位置切换") : qsTr("位置立即切换")
      width: 200
      height: 25
      onClicked: QoolToolTipWindow.smoothPositioning = checked
      onEntered: internTT1.showing_event()
      onExited: internTT1.closing_event()
      QoolToolTip {
        id: internTT1
        handleMouseHover: false
        text: qsTr("Tooltip的窗口位置可以动态移动的！")
      }
    }

    QoolButton {
      width: 200
      height: 25
      text: qsTr("“我是谁我在哪？”")
      QoolToolTip {
        id: internTT2
        handleMouseHover: false
        text: qsTr("还可以只使用方法，把方法绑定到控件自带的信号上去呢！\n具体方法请看代码吧！")
      }
      onEntered: internTT2.showing_event()
      onExited: internTT2.closing_event()
    }
  }
}
