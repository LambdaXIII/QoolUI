#ifndef BASICCOLORIST_H
#define BASICCOLORIST_H

#include <QObject>
#include <QColor>
#include <QVariant>
#include "qool_global.h"
#include <optional>
#include <QMutex>

QOOL_NS_BEGIN
class QOOL_SHARED_EXPORT BasicColorist : public QObject
{
  Q_OBJECT
public:
  explicit BasicColorist(QObject *parent = nullptr);

  Q_INVOKABLE static QColor blackOrWhite(const QColor &color, bool preferBlack=true);
  Q_INVOKABLE static QVariantList rgb(const QColor &color);
  Q_INVOKABLE static qreal alpha(const QColor &color);
  Q_INVOKABLE static QVariantList hsl(const QColor &color);
  Q_INVOKABLE static QVariantList hsv(const QColor &color);
  Q_INVOKABLE static QVariantList cmyk(const QColor &color);
  Q_INVOKABLE static QString hex(const QColor &color, bool withAlpha=false);
  Q_INVOKABLE QString name(const QColor &color, bool withAlpha=false);

protected:
  QMutex m_nameMap_lock;
  QMap<QString,QString>& nameMap();
  std::optional<QMap<QString,QString>> m_nameMap;
};
QOOL_NS_END

#endif // BASICCOLORIST_H
