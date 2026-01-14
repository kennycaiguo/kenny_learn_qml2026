import QtQuick
import QtQuick.Particles

Rectangle {
    id: root
    width: 550;height: 400
    color: "#333333"
    property var images:[
       "box_blue.png",
       "box_red.png",
       "box_green.png",
       "circle_blue.png",
       "circle_red.png",
       "circle_green.png",
       "triangle_blue.png",
       "triangle_red.png",
       "triangle_green.png",
    ]

    ParticleSystem{
        id: particleSystem
    }

    Emitter{
        id: emitter
        // anchors.fill: root
        // anchors.margins: 32
        width: 1.5;height: 1.5
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        system: particleSystem
        emitRate: 20
        lifeSpan: 5000
        lifeSpanVariation: 400
        size: 32
        velocity: AngleDirection {
            angle: 0 //0代表向右运动
            angleVariation: 15
            magnitude: 100
            magnitudeVariation: 50
        }
    }

    ItemParticle{
       id: particle
       system: particleSystem
       delegate: particleDelegate
    }

    Component{
        id: particleDelegate
        Item{
          id:container
          width: 10*Math.ceil(Math.random()*3 )
          height: width
          Image{
            anchors.fill: parent
            anchors.margins: 4
            source: "qrc:/assets/" + root.images[Math.floor(Math.random()*9)]
          }
        }
    }
}
