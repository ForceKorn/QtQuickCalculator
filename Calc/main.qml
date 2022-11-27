import QtQuick
import QtQuick.Controls 6.3

Window {
    id: mainWindow
    width: 320
    height: 480
    opacity: 0.9
    visible: true
    flags: Qt.Window
    minimumHeight: 480
    minimumWidth: 320
    color: "red"
    title: qsTr("Calculator")

    Column {
        id: mainWindowsLayout
        anchors.fill: parent
        anchors.topMargin: 5
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.bottomMargin: 5

        Row {
            id: tools
            x: parent.leftPadding
            y: parent.topPadding
            width: parent.width
            height: 30

            Button {
                id: btnOpenNavigation
                x: parent.anchors.leftMargin
                y: parent.anchors.topMargin
                width: 40
                height: parent.height
            }

            Text {
                id: lblDisplayedMode
                width: 120
                height: parent.height
                text: qsTr("Standard")
                font.letterSpacing: 0
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                lineHeight: 1
                font.styleName: "#000000"
                font.family: "Verdana"
            }

            Button {
                id: btnKeepOnTop
                y: parent.anchors.topMargin
                width: 40
                height: parent.height
            }

            Item {
                id: sprTools1
                x: btnKeepOnTop.anchors.rightMargin
                y: tools.anchors.topMargin
                width: 60
                height: parent.height
            }

            Button {
                id: btnHistory
                width: 40
                x: parent.width - width - 5
                height: parent.height
            }

        }

        Column {
            id: output
            width: mainWindowsLayout.width
            height: 100
        }

        Row {
            id: memory
            width: mainWindowsLayout.width
            height: 30
            // Row style for button adding

            Button {
                id: btnMemoryClearAll
                width: parent.width / 6
                height: parent.height
                text: qsTr("MC")
            }

            Button {
                id: btnMemoryRecall
                width: parent.width / 6
                height: parent.height
                text: qsTr("MR")
            }


            Button {
                id: btnMemoryAdd
                width: parent.width / 6
                height: parent.height
                text: qsTr("M+")
            }

            Button {
                id: btnMemoryRemove
                width: parent.width / 6
                height: parent.height
                text: qsTr("M-")
            }

            Button {
                id: btnMemoryStore
                width: parent.width / 6
                height: parent.height
                text: qsTr("MS")
            }

            Button {
                id: btnMemoryManage
                width: parent.width / 6
                height: parent.height
                text: qsTr("M*")
            }
        }

        Grid {
            id: input
            width: mainWindowsLayout.width
            height: mainWindowsLayout.height - tools.height - memory.height - output.height
            spacing: 1
            columns: 4
            rows: 6

            Button {
                id: btnPercentage
                width: parent.width / parent.columns
                height: parent.height / parent.rows
                text: qsTr("%")
            }

            Button {
                id: btnCE
                width: parent.width / parent.columns
                height: parent.height / parent.rows
                text: qsTr("CE")
            }

            Button {
                id: btnC
                width: parent.width / parent.columns
                height: parent.height / parent.rows
                text: qsTr("C")
            }

            Button {
                id: btnDelete
                width: parent.width / parent.columns
                height: parent.height / parent.rows
                text: qsTr("Del")
            }



        }
    }
}

