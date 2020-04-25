#include "basicqoolbuttongroup.h"
QOOL_NS_BEGIN
BasicQoolButtonGroup::BasicQoolButtonGroup(QObject* parent)
  : QObject(parent)
  , m_exclusive(true) {
}

BasicQoolButtonGroup::~BasicQoolButtonGroup() {
  auto a = m_buttonList;
  for (auto b : a) {
    removeButton(b);
  }
}

void BasicQoolButtonGroup::removeButton(QObject* button) {
  if (m_buttonList.contains(button)) {
    for (const auto& x : m_connections[button]) {
      disconnect(x);
    }
    m_connections.remove(button);
    m_buttonList.removeAll(button);
  }
}

void BasicQoolButtonGroup::addButton(QObject* button) {
  if (! m_buttonList.contains(button)) {
    m_connections[button]
      << connect(button, SIGNAL(clicked()), this, SLOT(handleClicks()))
      << connect(button, &QObject::destroyed,
           [&] { this->removeButton(button); });
    m_buttonList.append(button);
  }
}

BasicQoolButtonGroupAttachedType*
  BasicQoolButtonGroup::qmlAttachedProperties(QObject* object) {
  return new BasicQoolButtonGroupAttachedType(object);
}

QQuickItem* BasicQoolButtonGroup::checkedButton() const {
  QQuickItem* res = nullptr;
  for (auto p : m_buttonList)
    if (p->property("checked").toBool())
      res = qobject_cast<QQuickItem*>(p);
  return res;
}

void BasicQoolButtonGroup::handleClicks() {
  QObject* button = sender();
  emit clicked(button);
  if (exclusive()) {
    if (button->property("checked").toBool()) {
      for (auto x : m_buttonList)
        if (x != button)
          x->setProperty("checked", false);
      emit checkedButtonChanged(qobject_cast<QQuickItem*>(button));
    }
  }
}

BasicQoolButtonGroupAttachedType::BasicQoolButtonGroupAttachedType(
  QObject* parent)
  : QObject(parent)
  , m_group(nullptr) {
  setup_group(nullptr, m_group);
  connect(this, &BasicQoolButtonGroupAttachedType::groupInternalChanged,
    this, &BasicQoolButtonGroupAttachedType::setup_group);
}

BasicQoolButtonGroupAttachedType::~BasicQoolButtonGroupAttachedType() {
  if (m_group)
    m_group->removeButton(parent());
}

void BasicQoolButtonGroupAttachedType::setup_group(
  BasicQoolButtonGroup* old, BasicQoolButtonGroup* current) {
  if (old != nullptr) {
    old->removeButton(parent());
  }
  if (current != nullptr)
    current->addButton(parent());
}

QOOL_NS_END
