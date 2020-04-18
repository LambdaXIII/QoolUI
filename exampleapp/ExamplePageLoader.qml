import QtQuick 2.13
import Qool.Controls 1.0
import QtQuick.Controls 2.14

QoolControl {
  id: root
  property alias pageSource: loader.source
  contentItem: ScrollView {
    clip: true
    Loader {
      id: loader
      anchors.fill: parent
      onLoaded: {
        let t = loader.item.pageTitle
        if (t)
          root.titleText.text = t
        else
          root.titleText.text = loader.source
      }
    }
  }

  function changePage(pagename) {
    let path = "Pages/" + pagename
    loader.source = path
  }

}
