#include "basicdigitalnumber.h"

#include <QDebug>
#include <QFile>
#include <QtMath>

QOOL_NS_BEGIN
BasicDigitalNumber::BasicDigitalNumber(QQuickItem* p)
  : QQuickPaintedItem(p) {
  connect(this, &BasicDigitalNumber::textInternalChanged,
    [=] { this->update(); });
  connect(this, &BasicDigitalNumber::partShrinkWidthInternalChanged,
    [=] { this->update(); });
  connect(this, &BasicDigitalNumber::partStrokeWidthInternalChanged,
    [=] { this->update(); });
  connect(this, &BasicDigitalNumber::partStrokeColorInternalChanged,
    [=] { this->update(); });
  connect(this, &BasicDigitalNumber::partColorInternalChanged,
    [=] { this->update(); });
  connect(this, &BasicDigitalNumber::partWidthInternalChanged,
    [=] { this->update(); });
}

void BasicDigitalNumber::paint(QPainter* painter) {
  auto code = partCode(m_text.at(0));
  auto parts = forgePartPaths(code);
  qDebug() << parts;
  for (const auto& path : parts)
    painter->fillPath(path, QBrush(m_partColor));
}

/*!
 * \brief BasicDigitalNumber::partBoxPath
 * 外框横竖线图形生成
 * \param w
 * \param h
 * \param shrink
 * \param vertical
 * \return
 */
QPainterPath BasicDigitalNumber::partBoxPath(
  qreal w, qreal h, qreal shrink, bool vertical) const {
  QPainterPath result;

  if (vertical) {
    //如果是垂直的
    auto ddd = w / 2;
    QList<QPointF> dots { { ddd, 0 + shrink }, { w - shrink, ddd },
      { w - shrink, h - ddd }, { ddd, h - shrink },
      { 0 + shrink, h - ddd }, { 0 + shrink, ddd } };
    result.moveTo(dots.takeFirst());
    for (const auto& p : dots)
      result.lineTo(p);
  } else {
    //水平方向的
    auto ddd = h / 2;
    QList<QPointF> dots { { 0 + shrink, ddd }, { ddd, 0 + shrink },
      { w - ddd, 0 + shrink }, { w - shrink, ddd },
      { w - ddd, h - shrink }, { ddd, h - shrink } };
    result.moveTo(dots.takeFirst());
    for (const auto& p : dots)
      result.lineTo(p);
  }

  result.closeSubpath();
  return result;
}

/*!
 * \brief BasicDigitalNumber::partInnerBoxPath
 * 内部斜线图形生成
 * \param w
 * \param h
 * \param shrink
 * \param lowerRight
 * \return
 */
QPainterPath BasicDigitalNumber::partInnerBoxPath(
  qreal w, qreal h, qreal shrink, bool lowerRight) const {
  QPainterPath result;
  qreal ddd = qSqrt(m_partWidth * m_partWidth / 2);

  QList<QPointF> pts;
  if (lowerRight) {
    pts = { { 0 + shrink, 0 + shrink }, { ddd, 0 + shrink },
      { w - shrink, h - ddd }, { w - shrink, h - shrink },
      { w - ddd, h - shrink }, { 0 + shrink, ddd } };
  } else {
    pts = { { 0 + shrink, h - ddd }, { w - ddd, 0 + shrink },
      { w - shrink, 0 + shrink }, { w - shrink, ddd },
      { ddd, h - shrink }, { 0 + shrink, h - shrink } };
  }
  result.moveTo(pts.takeFirst());
  for (const auto& p : pts)
    result.lineTo(p);
  result.closeSubpath();
  return result;
}

/*!
 * \brief BasicDigitalNumber::partTrianglePath
 * 绘制边角的三角形，直角顶点永远位于原点
 * \param direction
 * \return
 */
QPainterPath BasicDigitalNumber::partTrianglePath(
  qreal shrink, BasicDigitalNumber::TriDirection direction) const {
  auto half_w = m_partWidth / 2;

  QList<QPointF> pts;
  if (direction == Up) {
    pts = { { 0, 0 - shrink },
      { 0 - half_w + shrink, 0 - half_w + shrink },
      { half_w - shrink, 0 - half_w + shrink } };
  } else if (direction == Down) {
    pts = { { 0, 0 + shrink }, { 0 - half_w + shrink, half_w - shrink },
      { half_w - shrink, half_w - shrink } };
  } else if (direction == Left) {
    pts = { { 0 - shrink, 0 },
      { 0 - half_w + shrink, 0 - half_w + shrink },
      { 0 - half_w + shrink, half_w - shrink } };
  } else {
    pts = { { 0 + shrink, 0 }, { half_w - shrink, 0 - half_w + shrink },
      { half_w - shrink, half_w - shrink } };
  }

  QPainterPath result;
  result.moveTo(pts.takeFirst());
  for (const auto& p : pts)
    result.lineTo(p);
  result.closeSubpath();
  return result;
}

/*!
 * \brief BasicDigitalNumber::forgePartPaths
 * 根据字符组合路径
 * \param parts
 * \return
 */
QList<QPainterPath> BasicDigitalNumber::forgePartPaths(
  QStringList& parts) const {
  QList<QPainterPath> result;
  auto half_w = m_partWidth / 2;

  //横竖的大型部件
  auto _big_horizontal_part =
    partBoxPath(width() - m_partWidth, m_partWidth, m_partShrinkWidth);
  auto _big_vertical_part = partBoxPath(
    m_partWidth, height() / 2 - half_w, m_partShrinkWidth, true);

  //两个角度的小型部件
  qreal inner_height = (height() - m_partWidth * 3) / 4;
  qreal inner_width = (width() - m_partWidth * 2) / 2;
  auto _inner_part_lowerRight =
    partInnerBoxPath(inner_width, inner_height, m_partShrinkWidth);
  auto _inner_part_higherRight = partInnerBoxPath(
    inner_width, inner_height, m_partShrinkWidth, false);

  //下面小型部件的竖直位移
  auto bottom_inner_delta_y = inner_height * 2 + m_partWidth;

  for (const auto& part_name : parts) {
    if (part_name == "TOP")
      result << _big_horizontal_part.translated(half_w, 0);

    if (part_name == "CENTER")
      result << _big_horizontal_part.translated(
        half_w, height() / 2 - half_w);

    if (part_name == "BOTTOM")
      result << _big_horizontal_part.translated(
        half_w, height() - m_partWidth);

    if (part_name == "LEFTT")
      result << _big_vertical_part.translated(0, half_w);

    if (part_name == "LEFTB")
      result << _big_vertical_part.translated(0, height() / 2);

    if (part_name == "RIGHTT")
      result << _big_vertical_part.translated(
        width() - m_partWidth, half_w);

    if (part_name == "RIGHTB")
      result << _big_vertical_part.translated(
        width() - m_partWidth, height() / 2);

    //内部部件
    if (part_name == "INNER_TTL")
      result << _inner_part_lowerRight.translated(
        m_partWidth, m_partWidth);

    if (part_name == "INNER_TTR")
      result << _inner_part_higherRight.translated(
        width() / 2, m_partWidth);

    if (part_name == "INNER_TBL")
      result << _inner_part_higherRight.translated(
        m_partWidth, m_partWidth + inner_height);

    if (part_name == "INNER_TBR")
      result << _inner_part_lowerRight.translated(
        width() / 2, m_partWidth + inner_height);

    if (part_name == "INNER_BTL")
      result << _inner_part_lowerRight.translated(
        m_partWidth, m_partWidth + bottom_inner_delta_y);

    if (part_name == "INNER_BTR")
      result << _inner_part_higherRight.translated(
        width() / 2, m_partWidth + bottom_inner_delta_y);

    if (part_name == "INNER_BBL")
      result << _inner_part_higherRight.translated(
        m_partWidth, m_partWidth + inner_height + bottom_inner_delta_y);

    if (part_name == "INNER_BBR")
      result << _inner_part_lowerRight.translated(
        width() / 2, m_partWidth + inner_height + bottom_inner_delta_y);

      //判断三角形
#define __TRI__(x, y, z)                                               \
  partTrianglePath(m_partShrinkWidth, x).translated(y, z)
    if (part_name == "TRI_LT")
      result << __TRI__(Left, half_w, half_w);
    if (part_name == "TRI_LC")
      result << __TRI__(Left, half_w, height() / 2);
    if (part_name == "TRI_LB")
      result << __TRI__(Left, half_w, height() - half_w);

    if (part_name == "TRI_RT")
      result << __TRI__(Right, width() - half_w, half_w);
    if (part_name == "TRI_RC")
      result << __TRI__(Right, width() - half_w, height() / 2);
    if (part_name == "TRI_RB")
      result << __TRI__(Right, width() - half_w, height() - half_w);

    if (part_name == "TRI_TL")
      result << __TRI__(Up, half_w, half_w);
    if (part_name == "TRI_TR")
      result << __TRI__(Up, width() - half_w, half_w);

    if (part_name == "TRI_BL")
      result << __TRI__(Down, half_w, height() - half_w);
    if (part_name == "TRI_BR")
      result << __TRI__(Down, width() - half_w, height() - half_w);

#undef __TRI__
  } // for

  return result;
}

QStringList BasicDigitalNumber::partCode(QChar x) {
  QStringList result;

  QFile table(":/Qool/assets/digital_number_map.csv");
  if (table.open(QFile::ReadOnly | QFile::Text)) {
    QTextStream ss(&table);
    while (! ss.atEnd()) {
      auto l = ss.readLine();
      auto ls = l.split(",", Qt::SkipEmptyParts);
      if (ls.takeFirst() == x) {
        result = ls;
        break;
      }
    }
    table.close();
  }

  return result;
}

QOOL_NS_END
