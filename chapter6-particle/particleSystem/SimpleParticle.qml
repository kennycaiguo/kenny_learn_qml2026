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
        emitRate: 100
        lifeSpan: 1000
        lifeSpanVariation: 500
        size:  16
        endSize: 64 //32
        // Tracer{
        //     color: "green"
        // }
    }

    ImageParticle{
        source: "qrc:/assets/particle.png"
        system: particleSystem
    }
}
