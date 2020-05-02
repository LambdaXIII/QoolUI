pragma Singleton

import QtQuick 2.14

QtObject {

  property var dataObj: Object()

  function switched_from_group(button, group_name) {
    if (button.checked) {
      if (dataObj.hasOwnProperty(group_name)) {
        dataObj[group_name].checked = false
      }
      dataObj[group_name] = button
    } else {
      if (dataObj[group_name] === button)
        delete dataObj[group_name]
    }
  }


}
