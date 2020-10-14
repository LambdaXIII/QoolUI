#include "basicroundcornerbox.h"

#include <QPainter>

QOOL_NS_BEGIN

BasicRoundCornerBox::BasicRoundCornerBox(QQuickItem* p)
  : QQuickPaintedItem(p)
  , m_strokeWidth(1)
  , m_radius(10)
  , m_topLeftRadius(10)
  , m_topRightRadius(10)
  , m_bottomLeftRadius(10)
  , m_bottomRightRadius(10)
  , m_backColor(Qt::black)
  , m_strokeColor(Qt::red)
  , m_hasBack(true)
  , m_hasStroke(true)
  , m_imageOpacity(1)
  , m_imageFillStroke(false) {
  connect(this, &BasicRoundCornerBox::strokeWidthInternalChanged, this,
    &BasicRoundCornerBox::updateStrokes);
  connect(this, &BasicRoundCornerBox::topLeftRadiusInternalChanged,
    this, &BasicRoundCornerBox::updateTLCorner);
  connect(this, &BasicRoundCornerBox::topRightRadiusInternalChanged,
    this, &BasicRoundCornerBox::updateTRCorner);
  connect(this, &BasicRoundCornerBox::bottomLeftRadiusInternalChanged,
    this, &BasicRoundCornerBox::updateBLCorner);
  connect(this, &BasicRoundCornerBox::bottomRightRadiusInternalChanged,
    this, &BasicRoundCornerBox::updateBRCorner);

  connect(
    this, &BasicRoundCornerBox::backColorChanged, [&] { update(); });
  connect(
    this, &BasicRoundCornerBox::strokeColorChanged, [&] { update(); });
  connect(
    this, &BasicRoundCornerBox::hasBackChanged, [&] { update(); });
  connect(this, &BasicRoundCornerBox::hasStrokeChanged, [&] {
    updateStrokes(m_strokeWidth);
    updateCorners();
  });

  connect(
    this, &BasicRoundCornerBox::imagePathChanged, [&] { update(); });
  connect(
    this, &BasicRoundCornerBox::imageOpacityChanged, [&] { update(); });
  connect(this, &BasicRoundCornerBox::imageFillStrokeChanged,
    [&] { update(); });
}

void BasicRoundCornerBox::paint(QPainter* painter) {
  auto full_path = roundCornerPath();
  auto core_path = roundCornerPath(m_strokeWidth);

  if (m_hasBack)
    painter->fillPath(core_path, QBrush(m_backColor));

  if (m_imageOpacity > 0 && (! m_imagePath.isEmpty())) {
    auto img = scaledImage();
    if (! img.isNull()) {
      auto image_path = m_imageFillStroke ? full_path : core_path;
      painter->setClipPath(image_path);
      auto old_opacity = painter->opacity();
      painter->setOpacity(m_imageOpacity);
      painter->drawImage(imageRect(img), img);
      //恢复设置
      painter->setOpacity(old_opacity);
      painter->setClipping(false);
    }
  }

  if (m_hasStroke) {
    auto stroke_path = full_path.subtracted(core_path);
    painter->fillPath(stroke_path, QBrush(m_strokeColor));
  }
}

bool BasicRoundCornerBox::contains(const QPointF& p) const {
  auto range = roundCornerPath();
  return range.contains(p);
}

QPainterPath BasicRoundCornerBox::roundCornerPath(qreal offset) const {
  qreal t1 = checkRadius(m_topLeftRadius);
  qreal t2 = checkRadius(m_topRightRadius);
  qreal b1 = checkRadius(m_bottomLeftRadius);
  qreal b2 = checkRadius(m_bottomRightRadius);

  /*
  QPainterPath balls;
  balls.addEllipse(
    0 + offset, 0 + offset, t1 * 2 - offset, t1 * 2 - offset);
  balls.addEllipse(
    width() - t2 * 2, 0 + offset, t2 * 2 - offset, t2 * 2 - offset);
  balls.addEllipse(
    0 + offset, height() - b1 * 2, b1 * 2 - offset, b1 * 2 - offset);
  balls.addEllipse(width() - b2 * 2, height() - b2 * 2, b2 * 2 - offset,
    b2 * 2 - offset);

  QPainterPath top_box;
  top_box.moveTo(t1 + offset, 0 + offset);
  top_box.lineTo(width() - t2 - offset, 0 + offset);
  top_box.lineTo(width() - offset, t2 + offset);
  top_box.lineTo(width() - offset, height() - b2 - offset);
  top_box.lineTo(width() - b2 - offset, height() - offset);
  top_box.lineTo(b1 + offset, height() - offset);
  top_box.lineTo(0 + offset, height() - b1 - offset);
  top_box.lineTo(0 + offset, t1 + offset);
  top_box.closeSubpath();

  return balls.united(top_box).simplified();
  */

  QPainterPath result;

  //逆时针一笔画成
  result.moveTo(t1 + offset, 0 + offset);
  result.arcTo(
    0 + offset, 0 + offset, t1 * 2 - offset, t1 * 2 - offset, 90, 90);
  result.lineTo(0 + offset, height() - b1);
  result.arcTo(0 + offset, height() - b1 * 2, b1 * 2 - offset,
    b1 * 2 - offset, 180, 90);
  result.lineTo(width() - b2 - offset, height() - offset);
  result.arcTo(width() - b2 * 2, height() - b2 * 2, b2 * 2 - offset,
    b2 * 2 - offset, 270, 90);
  result.lineTo(width() - offset, t2 + offset);
  result.arcTo(width() - t2 * 2, 0 + offset, t2 * 2 - offset,
    t2 * 2 - offset, 0, 90);
  result.closeSubpath();

  return result;
}

qreal BasicRoundCornerBox::maxRadius() const {
  qreal a = width() > height() ? height() : width();
  return a / 2;
}

qreal BasicRoundCornerBox::checkRadius(qreal x) const {
  if (x < 0)
    return 0;
  if (x > maxRadius())
    return maxRadius();
  return x;
}

QImage BasicRoundCornerBox::scaledImage() const {
  QImage img(m_imagePath);
  qreal background_ratio = qreal(width()) / qreal(height());
  qreal image_ratio = qreal(img.width()) / qreal(img.height());
  if (background_ratio < image_ratio)
    return img.scaledToHeight(height(), Qt::SmoothTransformation);
  return img.scaledToWidth(width(), Qt::SmoothTransformation);
}

QRectF BasicRoundCornerBox::imageRect(const QImage& img) const {
  qreal w = img.isNull() ? 0 : img.width();
  qreal h = img.isNull() ? 0 : img.height();
  auto x = (width() - w) / 2;
  auto y = (height() - h) / 2;
  return { x, y, w, h };
}

void BasicRoundCornerBox::updateTLCorner(qreal a, qreal b) {
  qreal _s = checkRadius(a > b ? a : b);
  QRectF box(0, 0, _s + m_strokeWidth, _s + m_strokeWidth);
  update(box.toRect());
}

void BasicRoundCornerBox::updateTRCorner(qreal a, qreal b) {
  qreal _s = checkRadius(a > b ? a : b);
  QRectF box(width() - _s - m_strokeWidth, 0, _s + m_strokeWidth,
    _s + m_strokeWidth);
  update(box.toRect());
}

void BasicRoundCornerBox::updateBLCorner(qreal a, qreal b) {
  qreal _s = checkRadius(a > b ? a : b);
  QRectF box(0, height() - _s - m_strokeWidth, _s + m_strokeWidth,
    _s + m_strokeWidth);
  update(box.toRect());
}

void BasicRoundCornerBox::updateBRCorner(qreal a, qreal b) {
  qreal _s = checkRadius(a > b ? a : b);
  QRectF box(width() - _s - m_strokeWidth,
    height() - _s - m_strokeWidth, _s + m_strokeWidth,
    _s + m_strokeWidth);
  update(box.toRect());
}

void BasicRoundCornerBox::updateStrokes(qreal a, qreal b) {
  qreal _s = checkRadius(a > b ? a : b);
  QRectF top(0, 0, width(), _s);
  QRectF bottom(0, height() - _s, width(), _s);
  QRectF left(0, 0, _s, height());
  QRectF right(0, width() - _s, _s, height());
  update(top.toRect());
  update(bottom.toRect());
  update(left.toRect());
  update(right.toRect());
}

void BasicRoundCornerBox::updateCorners() {
  updateTLCorner(m_topLeftRadius);
  updateTRCorner(m_topRightRadius);
  updateBLCorner(m_bottomLeftRadius);
  updateBRCorner(m_bottomRightRadius);
}

QOOL_NS_END
