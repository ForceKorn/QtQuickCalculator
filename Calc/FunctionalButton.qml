import QtQuick
import QtQuick.Controls

Button
{
    width: parent.width / parent.columns
    height: parent.height / parent.rows

    onClicked: debugPrintButtonText(this.text);
}
