import QtQuick
import QtQuick.Particles

Rectangle {
    id: root
    width: 580; height: 240
    color: "#1F1F1F"

    ParticleSystem {
        id: particleSystem
    }

    ImageParticle {
        source: "qrc:/assets/star.png"
        system: particleSystem
        color: '#FFD700'
        colorVariation: 0.2
        rotation: 0
        rotationVariation: 45
        rotationVelocity: 15
        rotationVelocityVariation: 15
        entryEffect: ImageParticle.Scale
    }


    // #region M1
    Emitter {
        id: emitter
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width: 1; height: 1
        system: particleSystem
        lifeSpan: 6400
        lifeSpanVariation: 400
        size: 32
        velocity: AngleDirection {
            angle: 0 //0代表向右运动
            angleVariation: 15
            magnitude: 100
            magnitudeVariation: 50
        }
    }

    // #endregion M1
    Turbulence{
        anchors.horizontalCenter: parent.horizontalCenter
        system: particleSystem
        width: 240;height: 120
        strength: 100
        Tracer{}
    }
}
