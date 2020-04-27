#ifndef BASICQOOLBUTTONGROUP_H
#define BASICQOOLBUTTONGROUP_H

#include "qool_global.h"

#include <QObject>
#include <QQuickItem>

// TODO: 性能有点慢

QOOL_NS_BEGIN
class BasicQoolButtonGroupAttachedType;

class QOOL_SHARED_EXPORT BasicQoolButtonGroup: public QObject {
  Q_OBJECT
  QList<QObject*> m_buttonList;
  QMap<QObject*, QList<QMetaObject::Connection>> m_connections;
  QOOL_WRITABLE_PROPERTY(bool, exclusive) //是否只有一个按钮可以选中
  Q_PROPERTY(QQuickItem* checkedButton READ checkedButton NOTIFY
      checkedButtonChanged)

public:
  explicit BasicQoolButtonGroup(QObject* parent = nullptr);
  ~BasicQoolButtonGroup();

  Q_INVOKABLE void removeButton(QObject* button);
  Q_INVOKABLE void addButton(QObject* button);

  static BasicQoolButtonGroupAttachedType* qmlAttachedProperties(
    QObject* object);

  QQuickItem* checkedButton() const;

protected:
  Q_SLOT void handleClicks();

signals:
  void clicked(QObject* button);
  void checkedButtonChanged(QQuickItem* button);
};

class QOOL_SHARED_EXPORT BasicQoolButtonGroupAttachedType
  : public QObject {
  Q_OBJECT
  QOOL_WRITABLE_OBJ_PROPERTY(BasicQoolButtonGroup*, group)

public:
  explicit BasicQoolButtonGroupAttachedType(QObject* parent);
  ~BasicQoolButtonGroupAttachedType();

protected:
  void setup_group(
    BasicQoolButtonGroup* old, BasicQoolButtonGroup* current);
};

QOOL_NS_END

QML_DECLARE_TYPE(QoolUI::BasicQoolButtonGroup)
QML_DECLARE_TYPEINFO(
  QoolUI::BasicQoolButtonGroup, QML_HAS_ATTACHED_PROPERTIES)

#endif // BASICQOOLBUTTONGROUP_H
