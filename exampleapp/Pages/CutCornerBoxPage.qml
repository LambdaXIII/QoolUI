import QtQuick 2.0
import Qool.Components 1.0

ExpPage {

  pageTitle: qsTr("切角矩形填充图片")

  Column{
    anchors.centerIn: parent
    spacing: 20

    CutCornerBox{
      imagePath: ":/assets/picture1.jpg"
      width: 250
      height: 100
    }

    CutCornerBox{
      imagePath: ":/assets/picture2.jpg"
      width: 250
      height: 100
    }

  }


}
