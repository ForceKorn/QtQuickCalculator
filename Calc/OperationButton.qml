import QtQuick
import QtQuick.Controls

Button
{
    property string operation: '?'

    width: parent.width / parent.columns
    height: parent.height / parent.rows

    onClicked: debugUpdateOperation(this.text, this.operation);
}
