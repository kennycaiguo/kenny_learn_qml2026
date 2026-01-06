import QtQuick 2.5

Background {
   width: 240
   height: 300

   ListView{
       id:view
       anchors.fill: parent
       anchors.margins: 20
       currentIndex: 0
       clip: true
       model: 100
       delegate: numberDelegate
       spacing: 4
       highlight: highlightCom
       // highlightFollowsCurrentItem: false
       highlightFollowsCurrentItem: true
       focus: true
   }

   Component{
       id: highlightCom
       Item{
           width: ListView.view.width
           height: ListView.view.currentItem.height
           y: ListView.view.currentItem.y
           Behavior on y{
               SequentialAnimation{
                   PropertyAnimation{target:highlightRect;property:"opacity";to:0;duration: 200}
                   NumberAnimation{duration: 1}
                   PropertyAnimation{target:highlightRect;property:"opacity";to:1;duration: 200}
               }
           }

           // GreenBox{
           //    id:highlightRect
           //    anchors.fill: parent
           // }

           YellowBox{
              id:highlightRect
              anchors.fill: parent
           }
       }

   }

   Component{
       id:numberDelegate
       Item{
           width: 120;height: 40
           Text {
               anchors.centerIn: parent
               font.pixelSize: 14
               text: index
           }
       }
   }
}
