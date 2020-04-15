#ifndef BASICCUTCORNERBOX_H
#define BASICCUTCORNERBOX_H

#include "qool_global.h"

#include <QImage>
#include <QPainterPath>
#include <QQuickItem>
#include <QQuickPaintedItem>

QOOL_NS_BEGIN

class QOOL_SHARED_EXPORT BasicCutCornerBox: public QQuickPaintedItem {
  Q_OBJECT

  QOOL_WRITABLE_PROPERTY(qreal, strokeWidth)
  QOOL_WRITABLE_PROPERTY(qreal, cutSize)
  QOOL_WRITABLE_PROPERTY(QColor, backColor)
  QOOL_WRITABLE_PROPERTY(QColor, strokeColor)
  QOOL_WRITABLE_PROPERTY(bool, hasBack)
  QOOL_WRITABLE_PROPERTY(bool, hasStroke)
  QOOL_WRITABLE_PROPERTY(qreal, imageOpacity)
  QOOL_WRITABLE_PROPERTY(QString, imagePath)
  QOOL_WRITABLE_PROPERTY(bool, imageFillStroke)

public:
  explicit BasicCutCornerBox(QQuickItem* p = nullptr);

  /**
   * @brief 标准绘制方法
   * @param painter
   */
  void paint(QPainter* painter) override;

  Q_INVOKABLE bool contains(const QPointF& p) const override;

protected:
  /**
   * @brief 实时计算边框路径
   * @param offset 是边框收缩的距离
   * @return
   */
  QPainterPath cutCornerPath(qreal offset = 0) const;

  /**
   * @brief updateStrokes 发起边框部分画面更新
   * @param old_strokeWidth 边框部分变更前内容
   * @param new_strokeWidth 边框部分变更后内容
   */
  Q_SLOT void updateStrokes(
    qreal old_strokeWidth, qreal new_strokeWidth);

  /** 只更新左上角 */
  Q_SLOT void updateTLCorner(qreal old_cutSize, qreal new_cutSize);

  QImage scaledImage() const;
  QRectF imageRect(const QImage& img) const;
};

QOOL_NS_END

#endif // BASICCUTCORNERBOX_H
