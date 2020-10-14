import QtQuick 2.14
import Qool.Components 1.0
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import "ExtraControls"

ExpPage {
  pageTitle: qsTr("圆角矩形展示")

  Control {
    anchors.centerIn: parent
    width: 300
    height: 200
    background: RoundCornerBox {
      id: roundBox
      topLeftRadius: 100 * tlBar.progress
      topRightRadius: 100 * trBar.progress
      bottomLeftRadius: 100 * blBar.progress
      bottomRightRadius: 100 * brBar.progress
      strokeWidth: 10 * strokeBar.progress
    }
    padding: 10

    ButtonGroup {
      id: backGroup
    }

    contentItem: Item {
      GridLayout {
        columns: 2
        anchors.centerIn: parent
        ClickBar {
          id: strokeBar
          title: qsTr("线框宽度")
          progress: 0.1
          Layout.columnSpan: 2
          Layout.fillWidth: true
        }
        ClickBar {
          id: tlBar
          title: qsTr("左上角圆度")
          progress: 0.3
        }
        ClickBar {
          id: trBar
          title: qsTr("右上角圆度")
          progress: 0.1
        }
        ClickBar {
          id: blBar
          title: qsTr("左下角圆度")
          progress: 0.1
        }
        ClickBar {
          id: brBar
          title: qsTr("右下角圆度")
          progress: 0.1
        }
        ClickBar {
          title: qsTr("统一圆度")
          onProgressChanged: {
            tlBar.progress = progress
            trBar.progress = progress
            blBar.progress = progress
            brBar.progress = progress
          }
          Layout.columnSpan: 2
          Layout.fillWidth: true
        }

        ClickBar {
          title: qsTr("背景图片")
          onProgressChanged: {
            if (progress <= 0.3) {
              title = qsTr("无背景图片")
              roundBox.imagePath = ""
            } else if (progress <= 0.6) {
              title = qsTr("背景图片1")
              roundBox.imagePath = ":/assets/picture1.jpg"
            } else {
              title = qsTr("背景图片2")
              roundBox.imagePath = ":/assets/picture2.jpg"
            }
          }
          Layout.columnSpan: 2
          Layout.fillWidth: true
        }
      } //GridLayout
    } //contentItem:
  }
}
