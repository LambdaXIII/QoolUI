#include "basicdigitalnumber.h"

#include <QDebug>

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

QPainterPath BasicDigitalNumber::partBoxPath(qreal x, qreal y, qreal w,
  qreal h, qreal shrink, bool vertical) const {
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
  result.translate(x, y);
  return result;
}

QList<QPainterPath> BasicDigitalNumber::forgePartPaths(
  QStringList& parts) const {
  QList<QPainterPath> result;
  auto half_w = m_partWidth / 2;

  auto _big_horizontal_part = partBoxPath(
    0, 0, width() - m_partWidth, m_partWidth, m_partShrinkWidth);
  auto _big_vertical_part = partBoxPath(
    0, 0, m_partWidth, height() / 2 - half_w, m_partShrinkWidth, true);

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
