// ToDo: [issue]    <0 - x> operation
// ToDo: [next]     add functionality to functional buttons
// ToDo: [next]     add functionality to memory buttons
// ToDo: [next]     add style
// ToDo: [next]     add effects
// ToDo: [next]     move constants to separete file
// ToDo: [next]     move JS code to separete file


import QtQuick
import QtQuick.Controls

Window
{
    id: mainWindow

    // Used for detecting basic math operation: +-/*
    property string operation: '#';

    // Main calculation storage
    property double calculationResult: 0;
    property double argument1: 0;

    // Not used for now
    property double argument2: 0;

    // Used for change input state from "Append" to "Overrite and append" and viseversa
    property bool   isOverwritableState: true;

    width: 320
    height: 480
    opacity: 0.99
    visible: true
    minimumHeight: 480
    minimumWidth: 320
    flags: Qt.Window
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

        Row
        {
            id: tools
            width: parent.width
            height: 30

            Button
            {
                id: btnOpenNavigation
                width: 40
                height: parent.height
            }

            Text
            {
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

            Button
            {
                id: btnKeepOnTop
                width: 40
                height: parent.height
            }

            Button
            {
                id: btnHistory
                x: parent.width - width - 5
                width: 40
                height: parent.height
            }
        }

        Column
        {
            id: outputDisplay
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

        Row
        {
            id: memoryButtons

            property int columnsPerRow: 6

            width: mainWindowsLayout.width
            height: 30

            Button
            {
                id: btnMemoryClearAll

                width: parent.width / parent.columnsPerRow
                height: parent.height
                text: qsTr("MC")
                enabled: false

                onClicked: debugMemoryButtonStub(this.text)
            }

            Button
            {
                id: btnMemoryRecall

                width: parent.width / parent.columnsPerRow
                height: parent.height
                text: qsTr("MR")
                enabled: false

                onClicked: debugMemoryButtonStub(this.text)
            }

            Button
            {
                id: btnMemoryAdd

                width: parent.width / parent.columnsPerRow
                height: parent.height
                text: qsTr("M+")

                onClicked: debugMemoryButtonStub(this.text)
            }

            Button
            {
                id: btnMemoryRemove

                width: parent.width / parent.columnsPerRow
                height: parent.height
                text: qsTr("M-")

                onClicked: debugMemoryButtonStub(this.text)
            }

            Button
            {
                id: btnMemoryStore

                width: parent.width / parent.columnsPerRow
                height: parent.height
                text: qsTr("MS")

                onClicked: debugMemoryButtonStub(this.text)
            }

            Button
            {
                id: btnMemoryManage

                width: parent.width / parent.columnsPerRow
                height: parent.height
                text: qsTr("M*")
                enabled: false

                onClicked: debugMemoryButtonStub(this.text)
            }
        }

        Grid
        {
            id: inputButtons
            width: mainWindowsLayout.width
            height: mainWindowsLayout.height - tools.height - memoryButtons.height - outputDisplay.height
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

                onClicked: debugResetCalculator(this.text)
            }

            Button
            {
                id: btnC

                text: qsTr("C")
                width: parent.width / parent.columns
                height: parent.height / parent.rows

                onClicked: debugResetCalculator(this.text)
            }

            Button
            {
                id: btnDelete

                text: qsTr("Del")
                width: parent.width / parent.columns
                height: parent.height / parent.rows

                onClicked: debugRemoveLastDigit(this.text)
            }

            Button
            {
                id: btnInverse

                text: qsTr("1/x")
                width: parent.width / parent.columns
                height: parent.height / parent.rows

                onClicked: debugInverseButtonClickedHandler(this.text)
            }

            Button
            {
                id: btnPower2

                text: qsTr("x * x")
                width: parent.width / parent.columns
                height: parent.height / parent.rows

                onClicked: debugPower2ButtonClickedHandler(this.text)
            }

            Button
            {
                id: btnRoot2

                text: qsTr("sqrt x")
                width: parent.width / parent.columns
                height: parent.height / parent.rows

                onClicked: debugRoot2ButtonClickedHandler(this.text)
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

            Button
            {
                id: btnNegation
                text: qsTr("+/-")
                width: parent.width / parent.columns
                height: parent.height / parent.rows

                onClicked: debugNegationButtonClickedHandler(this.text);

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
                width: parent.width / parent.columns
                height: parent.height / parent.rows

                onClicked: debugDotButtonClickedHandler(this.text);
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

    // rename
    function debugPrintButtonText(token: string)
    {
        console.log("\'" + token + "\'" + " button clicked!");
    }

    // ToDo: Refactor
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

    function debugRemoveLastDigit(buttonText : string)
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

    function debugResetCalculator(buttonText : string)
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

        calculationResult = parseFloat(teUserInput.text);
    }

    function debugCalculateOperation(buttonText : string)
    {
        debugPrintButtonText(buttonText);
        lblUserInput.text = calculationResult + " " + operation + " " + teUserInput.text + " = ";

        argument1 = parseFloat(teUserInput.text);
        switch(operation)
        {
            case '+': calculationResult += argument1; break;
            case '-': calculationResult -= argument1; break;
            case '*': calculationResult *= argument1; break;
            case '/': calculationResult /= argument1; break;
        }

        teUserInput.text = calculationResult;
    }

    // ToDo: Refactor
    function debugNegationButtonClickedHandler(buttonText : string)
    {
        debugPrintButtonText(buttonText);
        if (teUserInput.text !== '0')
        {
            if(teUserInput.text[0] !== '-')
            {
                teUserInput.text = '-' + teUserInput.text;
            }
            else
            {
                teUserInput.text = teUserInput.text.substr(1);
            }
        }
    }

    function debugPower2ButtonClickedHandler(buttonText : string)
    {
        debugPrintButtonText(buttonText);

        const parsedArgument = parseFloat(teUserInput.text);
        const parsedArgumentSquare = parsedArgument * parsedArgument;

        teUserInput.text = parsedArgumentSquare;
        lblUserInput.text += " sqr(" + parsedArgument + ")";
    }

    function debugRoot2ButtonClickedHandler(buttonText : string)
    {
        debugPrintButtonText(buttonText);

        const parsedArgument = parseFloat(teUserInput.text);
        const parsedArgumentRoot = Math.sqrt(parsedArgument);

        teUserInput.text = parsedArgumentRoot;
        lblUserInput.text += " sqrt(" + parsedArgument + ")";
    }

    function debugInverseButtonClickedHandler(buttonText : string)
    {
        debugPrintButtonText(buttonText);

        const parsedArgument = parseFloat(teUserInput.text);
        const parsedArgumentInverse = 1.0 / parsedArgument;

        teUserInput.text = parsedArgumentInverse;
        lblUserInput.text += " 1 / (" + parsedArgument + ")";
    }

    function debugDotButtonClickedHandler(buttonText : string)
    {
        debugPrintButtonText(buttonText);

        const dotSign = '.';
        if (teUserInput.text.indexOf(dotSign) === -1)
        {
            teUserInput.text += dotSign;
        }
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
