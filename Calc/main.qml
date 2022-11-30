import QtQuick
import QtQuick.Controls

Window
{
    id: mainWindow

    property string operation: '#';
    property double calculationResult: 0;
    property double argument1: 0;
    property double argument2: 0;
    property bool   isOverwritableState: true;

    width: 320
    height: 480
    opacity: 0.99
    visible: true
    flags: Qt.Window
    minimumHeight: 480
    minimumWidth: 320
    color: "red"
    title: qsTr("Calculator")

    Column
    {
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

        Column
        {
            id: output
            width: mainWindowsLayout.width
            height: 100

            Text
            {
                id: lblUserInput
                text: qsTr("")
                width: parent.width
                anchors.right: parent.right
                font.pixelSize: 14
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 0
                anchors.topMargin: 0
            }

            TextEdit
            {
                id: teUserInput
                width: parent.width
                height: parent.height / 2
                color: "#000000"
                text: qsTr("0")
                anchors.right: parent.right
                font.pixelSize: 36
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 0
                anchors.topMargin: 16
                readOnly: true
            }
        }

        Row {
            id: memory
            width: mainWindowsLayout.width
            height: 30
            /* ?
            columns: 4
            rows: 6
            */

            Button
            {
                id: btnMemoryClearAll
                width: parent.width / 6
                height: parent.height
                text: qsTr("MC")
                onClicked: debugMemoryButtonStub(this.text)
            }

            Button
            {
                id: btnMemoryRecall
                width: parent.width / 6
                height: parent.height
                text: qsTr("MR")
                onClicked: debugMemoryButtonStub(this.text)
            }

            Button
            {
                id: btnMemoryAdd
                width: parent.width / 6
                height: parent.height
                text: qsTr("M+")
                onClicked: debugMemoryButtonStub(this.text)
            }

            Button
            {
                id: btnMemoryRemove
                width: parent.width / 6
                height: parent.height
                text: qsTr("M-")
                onClicked: debugMemoryButtonStub(this.text)
            }

            Button
            {
                id: btnMemoryStore
                width: parent.width / 6
                height: parent.height
                text: qsTr("MS")
                onClicked: debugMemoryButtonStub(this.text)
            }

            Button
            {
                id: btnMemoryManage
                width: parent.width / 6
                height: parent.height
                text: qsTr("M*")
                onClicked: debugMemoryButtonStub(this.text)
            }
        }

        Grid
        {
            id: input
            width: mainWindowsLayout.width
            height: mainWindowsLayout.height - tools.height - memory.height - output.height
            spacing: 1
            columns: 4
            rows: 6

            FunctionalButton
            {
                id: btnPercentage
                text: qsTr("%")
            }

            Button
            {
                id: btnCE
                text: qsTr("CE")
                width: parent.width / parent.columns
                height: parent.height / parent.rows
                onClicked: debugClearNumber(this.text)
            }

            Button
            {
                id: btnC
                text: qsTr("C")
                width: parent.width / parent.columns
                height: parent.height / parent.rows
                onClicked: debugClearNumber(this.text)
            }

            Button
            {
                id: btnDelete
                text: qsTr("Del")
                width: parent.width / parent.columns
                height: parent.height / parent.rows
                onClicked: debugClearDigit(this.text)
            }

            FunctionalButton
            {
                id: btnRecipical
                text: qsTr("1/x")
            }

            FunctionalButton
            {
                id: btnPower2
                text: qsTr("x * x")
            }

            FunctionalButton
            {
                id: btnRoot2
                text: qsTr("sqrt x")
            }

            OperationButton
            {
                id: btnDivision
                operation: "/"
                text: qsTr(operation)
            }

            NumericButton
            {
                id: btnSeven
                digit: "7"
                text: qsTr(digit)
            }

            NumericButton
            {
                id: btnEight
                digit: "8"
                text: qsTr(digit)
            }

            NumericButton
            {
                id: btnNine
                digit: "9"
                text: qsTr(digit)
            }

            OperationButton
            {
                id: btnMultiplication
                operation: "*"
                text: qsTr(operation)
            }

            NumericButton
            {
                id: btnFour
                digit: "4"
                text: qsTr(digit)
            }

            NumericButton
            {
                id: btnFive
                digit: "5"
                text: qsTr(digit)
            }

            NumericButton
            {
                id: btnSix
                digit: "6"
                text: qsTr(digit)
            }

            OperationButton
            {
                id: btnSubstraction
                operation: "-"
                text: qsTr(operation)
            }

            NumericButton
            {
                id: btnOne
                digit: "1"
                text: qsTr(digit)
            }

            NumericButton
            {
                id: btnTwo
                digit: "2"
                text: qsTr(digit)
            }

            NumericButton
            {
                id: btnThree
                digit: "3"
                text: qsTr(digit)
            }

            OperationButton
            {
                id: btnAddition
                operation: "+"
                text: qsTr(operation)
            }

            FunctionalButton
            {
                id: btnNegate
                text: qsTr("+/-")
            }

            NumericButton
            {
                id: btnZero
                digit: "0"
                text: qsTr(digit)
            }

            FunctionalButton
            {
                id: btnDot
                text: qsTr(".")
            }

            Button
            {
                id: btnEquals
                text: qsTr("=")
                width: parent.width / parent.columns
                height: parent.height / parent.rows
                onClicked: debugCalculateOperation(this.text);
            }

        }
    }

    function debugPrintButtonText(token: string)
    {
        console.log("\'" + token + "\'" + " button clicked!");
    }

    function debugAppendNumber(buttonText : string, buttonDigit : string)
    {
        debugPrintButtonText(buttonText);
        if (teUserInput.text.length < 9) // as constant <treshold>
        {
            if (teUserInput.text === "0")
            {
                teUserInput.text = buttonDigit;
            }
            else
            {
                if (operation !== '#' && isOverwritableState)
                {
                    teUserInput.text = buttonDigit;
                    isOverwritableState = false;
                }
                else
                {
                    teUserInput.text = teUserInput.text + buttonDigit;
                }
            }
        }
        else
        {
            console.log("Can`t insert more than 9 digits to line");
        }
    }

    function debugClearDigit(buttonText : string)
    {
        debugPrintButtonText(buttonText);

        teUserInput.text = teUserInput.text.substr(0, teUserInput.text.length - 1);
        if (teUserInput.text.length < 1)
        {
            teUserInput.text = "0";
        }
         // pop_back?
        console.log("lenght: " + teUserInput.text.length);
    }

    function debugClearNumber(buttonText : string)
    {
        debugPrintButtonText(buttonText);

        calculationResult = 0
        argument1 = 0

        lblUserInput.text = "";
        teUserInput.text = "0";

        console.log("lenght: " + teUserInput.text.length);
    }

    function debugUpdateOperation(buttonText : string, buttonOperation : string)
    {
        debugPrintButtonText(buttonText);

        operation = buttonOperation;
        isOverwritableState = true;

        lblUserInput.text = teUserInput.text + " " + operation;

        calculationResult = parseInt(teUserInput.text);
    }

    function debugCalculateOperation(buttonText : string)
    {
        debugPrintButtonText(buttonText);
        lblUserInput.text = calculationResult + " " + operation + " " + teUserInput.text + " = ";

        argument1 = parseInt(teUserInput.text);
        switch(operation)
        {
            case '+': calculationResult += argument1; break;
            case '-': calculationResult -= argument1; break;
            case '*': calculationResult *= argument1; break;
            case '/': calculationResult /= argument1; break;
        }

        teUserInput.text = calculationResult;
    }



    function debugMemoryButtonStub(buttonText : string)
    {
        debugPrintButtonText(buttonText);
    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
