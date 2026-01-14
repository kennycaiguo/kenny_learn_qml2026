import QtQuick
import QtQuick.Particles

Rectangle {
    id:root
    width: 480;height: 160
    color: "#1f1f1f"

    ParticleSystem{ //需要导入
        id: particleSystem
    }

    Emitter{
        id: emitter
        anchors.centerIn: parent
        width: 160;height: 80
        system: particleSystem
        lifeSpan: 2500
        lifeSpanVariation: 500
        size:  16
        endSize: 48

    }

    ImageParticle{
        source: "qrc:/assets/star.png"
        system: particleSystem
        color: "#FFD700"
        colorVariation: 0.2
        rotation: 0
        rotationVariation: 45
        rotationVelocity: 15
        rotationVelocityVariation: 15
        entryEffect: ImageParticle.Scale
        alpha: 0.5
        alphaVariation: 0.4
    }
}
