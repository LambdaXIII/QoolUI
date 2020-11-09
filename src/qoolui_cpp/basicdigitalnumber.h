#ifndef BASICDIGITALNUMBER_H
#define BASICDIGITALNUMBER_H

#include "qool_global.h"

#include <QChar>
#include <QObject>
#include <QPainter>
#include <QPainterPath>
#include <QQuickItem>
#include <QQuickPaintedItem>
#include <QStringList>

QOOL_NS_BEGIN

class QOOL_SHARED_EXPORT BasicDigitalNumber: public QQuickPaintedItem {
  Q_OBJECT

  QOOL_WRITABLE_PROPERTY(qreal, partWidth)        //笔画的粗细
  QOOL_WRITABLE_PROPERTY(QColor, partColor)       //笔画颜色
  QOOL_WRITABLE_PROPERTY(QColor, partStrokeColor) //笔画描边颜色
  QOOL_WRITABLE_PROPERTY(qreal, partStrokeWidth)  //笔画描边宽度
  QOOL_WRITABLE_PROPERTY(qreal, partShrinkWidth)  //笔画间距
  QOOL_WRITABLE_PROPERTY(QString, text) //需要显示的字符

public:
  explicit BasicDigitalNumber(QQuickItem* p = nullptr);

  void paint(QPainter* painter) override;

protected:
  QPainterPath partBoxPath(qreal x, qreal y, qreal w, qreal h,
    qreal shrink = 0, bool vertical = false) const;

  QList<QPainterPath> forgePartPaths(QStringList& parts) const;

  QStringList partCode(QChar x);

signals:
};

QOOL_NS_END

#endif // BASICDIGITALNUMBER_H
