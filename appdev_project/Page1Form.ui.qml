import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtCharts 2.2

Item {
    id: item1
    property alias button1: button1
    property alias chartView: chartView

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            Text {
                id: text1
                color: "#e91e1e"
                text: qsTr("Digital Currencies (HUF) - Daily")
                z: 1
                font.italic: true
                font.pointSize: 20
            }
        }

        RowLayout {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                id: button1
                text: qsTr("Refresh")
                Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            }
        }
    }

    Item {
        id: item2
        x: 0
        y: 58
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        ChartView {
            id: chartView
            title: "Bitcoin-HUF chart"
            anchors.fill: parent
            LineSeries {
                id: series
                name: "lineseries1"
                visible: true
            }
        }
    }
}
