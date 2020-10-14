import QtQuick 2.14
import Qool.Basic 1.0
import Qool.Styles 1.0

BasicRoundCornerBox {
  strokeWidth: 1
  backColor: QoolStyle.backgroundColor
  strokeColor: QoolStyle.backgroundStrokeColor
  topLeftRadius: radius
  topRightRadius: radius
  bottomLeftRadius: radius
  bottomRightRadius: radius
  radius: 10
}
