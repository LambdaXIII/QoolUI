import QtQuick 2.12
import QtQuick.XmlListModel 2.12

XmlListModel {

  source: "table_of_pages.xml"
  query: "/qool_pages/item"
  XmlRole {
    name: "title"
    query: "title/string()"
  }
  XmlRole {
    name: "page"
    query: "page/string()"
  }
}
