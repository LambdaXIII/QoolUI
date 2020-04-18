#ifndef QOOL_REGISTER_CLASSES_H
#define QOOL_REGISTER_CLASSES_H

#include "basiccutcornerbox.h"
#include "basicqoolbuttongroup.h"
#include "basicwindowclosebutton.h"

#include <QQmlEngine>

void qool_register_classes() {
#define QOOL_ERI "Qool.Basic", 1, 0

  qmlRegisterType<QoolUI::BasicCutCornerBox>(
    QOOL_ERI, "BasicCutCornerBox");
  qmlRegisterType<QoolUI::BasicWindowCloseButton>(
    QOOL_ERI, "BasicWindowCloseButton");

  qmlRegisterType<QoolUI::BasicQoolButtonGroup>(
    QOOL_ERI, "BasicQoolButtonGroup");

#undef QOOL_ERI
}

#endif // QOOL_REGISTER_CLASSES_H
