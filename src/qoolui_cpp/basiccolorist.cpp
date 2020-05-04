#include "basiccolorist.h"

#include <QFile>
#include <QTextStream>

QOOL_NS_BEGIN
BasicColorist::BasicColorist(QObject* parent)
  : QObject(parent) {
}

QColor BasicColorist::blackOrWhite(
  const QColor& color, bool preferBlack) {
  auto r = color.redF();
  auto g = color.greenF();
  auto b = color.blueF();
  auto a = (r + g + b) / 3;
  auto line = preferBlack ? 0.4 : 0.6;
  return a < line ? Qt::white : Qt::black;
}

qreal BasicColorist::alpha(const QColor& color) {
  return color.alphaF();
}

QVariantList BasicColorist::hsl(const QColor& color) {
  QVariantList res;
  res << color.hslHueF() << color.hslSaturationF()
      << color.lightnessF();
  return res;
}

QVariantList BasicColorist::hsv(const QColor& color) {
  QVariantList res;
  res << color.hsvHueF() << color.hsvSaturationF() << color.valueF();
  return res;
}

QVariantList BasicColorist::cmyk(const QColor& color) {
  QVariantList res;
  res << color.cyanF() << color.magentaF() << color.yellowF()
      << color.blackF();
  return res;
}

QString BasicColorist::hex(const QColor& color, bool withAlpha) {
  auto m = withAlpha ? QColor::HexArgb : QColor::HexRgb;
  return color.name(m);
}

QString BasicColorist::name(const QColor& color, bool withAlpha) {
  auto h = color.name();
  return nameMap().value(h, hex(color, withAlpha));
}

QMap<QString, QString>& BasicColorist::nameMap() {
  m_nameMap_lock.lock();
  if (! m_nameMap) {
    QFile table(":/Qool/assets/color_name_table.csv");
    if (! table.open(QFile::ReadOnly))
      throw std::invalid_argument(
        QT_TR_NOOP("色彩表不见了，肯定是你Port出了问题"));
    QTextStream s(&table);
    QMap<QString, QString> res;
    while (! s.atEnd()) {
      auto pairs = s.readLine().splitRef(',');
      res[pairs.last().toString().simplified()] =
        pairs.first().toString().simplified();
    }
    m_nameMap = res;
  }
  m_nameMap_lock.unlock();
  return *m_nameMap;
}

QVariantList BasicColorist::rgb(const QColor& color) {
  QVariantList result;
  result << color.redF();
  result << color.greenF();
  result << color.blueF();
  return result;
}

QOOL_NS_END
