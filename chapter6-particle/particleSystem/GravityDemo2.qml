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
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 1; height: 20
        system: particleSystem
        emitRate: 40
        lifeSpan: 6400
        lifeSpanVariation: 400
        size: 32
        velocity: AngleDirection {
            angle: -90
            angleVariation: 25
            magnitude: 100
            magnitudeVariation: 25
        }
    }
    // #endregion M1

    Friction{
        anchors.horizontalCenter: parent.horizontalCenter
        width: 240; height: 120
        system: particleSystem
        factor: 0.8
        threshold: 25
        Tracer{}
    }
}
