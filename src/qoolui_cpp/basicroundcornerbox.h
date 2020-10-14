#ifndef BASICROUNDCORNERBOX_H
#define BASICROUNDCORNERBOX_H

#include "qool_global.h"

#include <QImage>
#include <QPainterPath>
#include <QQuickItem>
#include <QQuickPaintedItem>

QOOL_NS_BEGIN

class BasicRoundCornerBox: public QQuickPaintedItem {
  Q_OBJECT
  QOOL_WRITABLE_PROPERTY(qreal, strokeWidth)
  QOOL_WRITABLE_PROPERTY(qreal, radius)
  QOOL_WRITABLE_PROPERTY(qreal, topLeftRadius)
  QOOL_WRITABLE_PROPERTY(qreal, topRightRadius)
  QOOL_WRITABLE_PROPERTY(qreal, bottomLeftRadius)
  QOOL_WRITABLE_PROPERTY(qreal, bottomRightRadius)
  QOOL_WRITABLE_PROPERTY(QColor, backColor)
  QOOL_WRITABLE_PROPERTY(QColor, strokeColor)
  QOOL_WRITABLE_PROPERTY(bool, hasBack)
  QOOL_WRITABLE_PROPERTY(bool, hasStroke)
  QOOL_WRITABLE_PROPERTY(qreal, imageOpacity)
  QOOL_WRITABLE_PROPERTY(QString, imagePath)
  QOOL_WRITABLE_PROPERTY(bool, imageFillStroke)

public:
  explicit BasicRoundCornerBox(QQuickItem* p = nullptr);

  void paint(QPainter* painter) override;

  Q_INVOKABLE bool contains(const QPointF& p) const override;

protected:
  QPainterPath roundCornerPath(qreal offset = 0) const;
  qreal maxRadius() const;
  qreal checkRadius(qreal x) const;

  QImage scaledImage() const;
  QRectF imageRect(const QImage& img) const;

  void updateTLCorner(qreal a, qreal b = 0);
  void updateTRCorner(qreal a, qreal b = 0);
  void updateBLCorner(qreal a, qreal b = 0);
  void updateBRCorner(qreal a, qreal b = 0);
  void updateStrokes(qreal a, qreal b = 0);
  void updateCorners();
};

QOOL_NS_END

#endif // BASICROUNDCORNERBOX_H
