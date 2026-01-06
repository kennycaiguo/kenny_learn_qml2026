import QtQuick

Item {
    id:root
    anchors.fill: parent


    MyInput{
        id:input1
        KeyNavigation.tab: input2
        focus:true
    }



    MyInput{
        id:input2
        focus: false
        y:40
        KeyNavigation.tab:  input1
    }



}
