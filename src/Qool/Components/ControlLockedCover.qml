import QtQuick 2.0

SmallIndicator {
  anchors.right: parent.right
  anchors.bottom: parent.bottom
  anchors.margins: 3
  visible: !parent.enabled
}
