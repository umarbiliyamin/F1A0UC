import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("AlphaVantage TimeSeries")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
        }

        Page2 {

        }
        Page3 {

        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("TimeSeries1")
        }
        TabButton {
            text: qsTr("TimeSeries2")
        }
        TabButton {
            text: qsTr("TimeSeries3")
        }
    }
}
