import QtQuick
import QtQuick.Controls

Button
{
    property string digit: '0'

    width: parent.width / parent.columns
    height: parent.height / parent.rows

    onClicked: debugAppendNumber(this.text, this.digit);
}
