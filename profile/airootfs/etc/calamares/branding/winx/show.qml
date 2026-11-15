import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation
    Timer {
        interval: 8000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }
    Slide {
        Rectangle {
            anchors.fill: parent
            color: "#0F172A"
            Column {
                anchors.centerIn: parent
                spacing: 14
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Familiar Workflow, Zero Bloat"
                    color: "#00BCF2"
                    font.pixelSize: 28
                    font.bold: true
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Your taskbar, Start menu, and WinX Word, Excel & PowerPoint are ready offline—no cloud sign-ins required."
                    color: "#E2E8F0"
                    font.pixelSize: 15
                }
            }
        }
    }
    Slide {
        Rectangle {
            anchors.fill: parent
            color: "#0F172A"
            Column {
                anchors.centerIn: parent
                spacing: 14
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Desktop + Steam Deck Console Mode"
                    color: "#00BCF2"
                    font.pixelSize: 28
                    font.bold: true
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Pre-configured with 64-bit Steam Runtime, Gamescope HDR/VRR, Lutris, and full AMD/Intel/NVIDIA Vulkan drivers."
                    color: "#E2E8F0"
                    font.pixelSize: 15
                }
            }
        }
    }
}
