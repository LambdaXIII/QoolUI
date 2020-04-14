#ifndef QOOL_GLOBAL_H
#define QOOL_GLOBAL_H

#include <QObject>

#ifdef OS_WIN
  #ifdef DLL_EXPORT
    #define QOOL_SHARED_EXPORT __declspec(dllexport)
  #else
    #define QOOL_SHARED_EXPORT __declspec(dllimport)
  #endif
#else // OSWIN
  #define QOOL_SHARED_EXPORT
#endif

#define QOOL_NS_BEGIN namespace QoolUI {
#define QOOL_NS_END }

#define QOOL_WRITABLE_PROPERTY(type, name)                             \
protected:                                                             \
  type m_##name;                                                       \
  Q_PROPERTY(                                                          \
    type name READ name WRITE set_##name NOTIFY name##Changed)         \
public:                                                                \
  type name() const { return m_##name; }                               \
  void set_##name(const type& value) {                                 \
    if (value == m_##name)                                             \
      return;                                                          \
    auto old_value = m_##name;                                         \
    m_##name = value;                                                  \
    emit name##Changed(m_##name);                                      \
    emit name##InternalChanged(old_value, m_##name);                   \
  }                                                                    \
  Q_SIGNAL void name##Changed(const type& value);                      \
  Q_SIGNAL void name##InternalChanged(type old, const type& current);

#define QOOL_READONLY_PROPERTY(type, name)                             \
protected:                                                             \
  type m_##name;                                                       \
  Q_PROPERTY(type name READ name NOTIFY name##Changed)                 \
public:                                                                \
  type name() const { return m_##name; }                               \
  void update_##name(const type& value) {                              \
    if (value == m_##name)                                             \
      return;                                                          \
    auto old_value = m_##name;                                         \
    m_##name = value;                                                  \
    emit name##Changed(m_##name);                                      \
    emit name##InternalChanged(old_value, m_##name);                   \
  }                                                                    \
  Q_SIGNAL void name##Changed(const type& value);                      \
  Q_SIGNAL void name##InternalChanged(type old, const type& current);

#endif // QOOL_GLOBAL_H
