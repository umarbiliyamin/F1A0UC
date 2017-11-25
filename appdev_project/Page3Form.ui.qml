import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtCharts 2.2

Item {
    id: item1
    property alias button1: button1
    property alias columnLayout: columnLayout
    property alias chartView: chartView

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        RowLayout {
            z: 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
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
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                id: button1
                text: qsTr("Refresh")
            }
        }
    }
    Item {
        id: item2
        x: 0
        width: parent.width

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.top: parent.top
        anchors.topMargin: 40
        ChartView {
            id: chartView
            title: "Bitcoin Market Cap"
            anchors.fill: parent
            LineSeries {
                id: series
                name: "lineseries3"
                visible: true
            }
        }
    }
}
