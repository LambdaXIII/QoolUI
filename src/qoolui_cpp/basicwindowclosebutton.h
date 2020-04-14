#ifndef BASICWINDOWCLOSEBUTTON_H
#define BASICWINDOWCLOSEBUTTON_H

#include "qool_global.h"

#include <QPainter>
#include <QPainterPath>
#include <QQuickItem>
#include <QQuickPaintedItem>

QOOL_NS_BEGIN

class QOOL_SHARED_EXPORT BasicWindowCloseButton
  : public QQuickPaintedItem {
  Q_OBJECT
  QOOL_WRITABLE_PROPERTY(QColor, fillColor)
  
  
  QOOL_WRITABLE_PROPERTY(QColor, strokeColor)

  QOOL_READONLY_PROPERTY(bool, hovered)
  QOOL_READONLY_PROPERTY(bool, down)

public:
  explicit BasicWindowCloseButton(QQuickItem* p = nullptr);

  void paint(QPainter* painter) override;

  Q_INVOKABLE bool contains(const QPointF& p) const override;

protected:
  QPainterPath trianglePath() const;
  void hoverEnterEvent(QHoverEvent*) override;
  void hoverLeaveEvent(QHoverEvent*) override;
  void mousePressEvent(QMouseEvent*) override;
  void mouseReleaseEvent(QMouseEvent* mouse) override;

signals:
  void clicked(QMouseEvent* mouse);
};

QOOL_NS_END

#endif // BASICWINDOWCLOSEBUTTON_H
