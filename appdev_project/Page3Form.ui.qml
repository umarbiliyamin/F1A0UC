import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: item1
    property alias button1: button1
    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        Text {
            id: text1
            color: "#e91e1e"
            text: qsTr("Digital Currencies Market Cap - Daily")
            font.pointSize: 20
            font.italic: true
        }
    }

    RowLayout {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        Button {
            id: button1
            text: qsTr("Refresh")
        }
    }
}
