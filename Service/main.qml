import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
import QtQml 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

/****************************************** Properties ******************************************/
    property string normalwallpaper: "qrc:/Image/image.jpg"
    property string rainwallpaper: "qrc:/Image/RainW.png"
    property string yellowallpaper: "qrc:/Image/SunnyW.png"
    property int  n1 : 0
    property int  n2 : 0
    property int  n3 : 0
    property int  n4 : 0
/****************************************** Properties ******************************************/

    Image {
        id:bw
        width: 700
        height: 450
        anchors.centerIn: parent
        source: normalwallpaper

/******************************************Current Time******************************************/      
        Label {
           id:l6
           text: "time"
           font.bold: true
           color: "white"
           font.pixelSize: 7
           x: 333
           y: 3
        }
        Timer {
          id:timer1
          interval: 500
          repeat: true
          running: true
          triggeredOnStart: true
          onTriggered: {
                l6.text=new Date().toLocaleTimeString(Qt.locale("en_US"),"hh:mm:ss ap")
           }
         }
/******************************************Current Time******************************************/

/******************************************Label******************************************/
       Label {
         id:l1
         x: 100
         y: 109
         font.bold: true
         font.pixelSize: 30
         text: ""
         color: "white"
         width: 59
         height: 70
        }
        Label {
          id:l2
          x: 250
          y: 109
          font.bold: true
          font.pixelSize: 30
          text: ""
          color: "white"
          width: 59
          height: 113
         }
         Label {
           id:l3
           x: 412
           y: 109
           font.bold: true
           font.pixelSize: 30
           text: ""
           color: "white"
           width: 59
           height: 113
          }
          Label {
            id:l4
            x: 553
            y: 109
            font.bold: true
            font.pixelSize: 30
            text: ""
            color: "white"
            width: 59
            height: 113
          }
          Label {
            id:l5
            font.bold: true
            font.pixelSize: 25
            text: ""
            color: "white"
            x: 325
            y: 30
            SequentialAnimation {
                 loops: Animation.Infinite
                 running: true
                  OpacityAnimator {
                          target: l5
                          from: 0
                          to: 1
                          duration: 900
                          running: true
                  }
                  OpacityAnimator {
                          target: l5
                          from: 1
                          to: 0
                          duration: 9000
                          running: true
                  }
             }
        }
/******************************************Label******************************************/

/******************************************AirSpeed Rectangle******************************************/

        Rectangle {
            id:r1
            width: 75
            height: 30
            radius: width
            color: "transparent"
            x:80
            y:380
            border.width: 1
            border.color: "white"
            Text {
                id: t1
                text: qsTr("AirSpeed")
                anchors.centerIn: parent
                color: "white"
                font.bold: true
            }
            MouseArea {
                 anchors.fill: parent
                 onClicked: {
                     testing.stopAirspeed()
                 }
            }
        }
/******************************************AirSpeed Rectangle******************************************/

/******************************************AirMoisture Rectangle******************************************/
        Rectangle {
            id:r2
            width: 75
            height: 30
            radius: width
            color: "transparent"
            x:230
            y:380
            border.width: 1
            border.color: "white"
            Text {
                id: t2
                text: qsTr("AirMoisture")
                anchors.centerIn: parent
                color: "white"
                font.bold: true
            }
            MouseArea {
                 anchors.fill: parent
                 onClicked: {
                     testing.stopAirMoisture()
                 }
            }
        }
/******************************************AirMoisture Rectangle******************************************/

/******************************************Temperature Rectangle******************************************/
        Rectangle {
            id:r3
            width: 75
            height: 30
            radius: width
            color: "transparent"
            x:380
            y:380
            border.width: 1
            border.color: "white"
            Text {
                id: t3
                text: qsTr("Temperature")
                anchors.centerIn: parent
                color: "white"
                font.bold: true
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                testing.stopTemp()
                }
           }
        }
/******************************************Temperature Rectangle******************************************/

/******************************************Rain Rectangle******************************************/
        Rectangle {
            id:r4
            width: 75
            height: 30
            radius: width
            color: "transparent"
            x:530
            y:380
            border.width: 1
            border.color: "white"
            Text {
                id: t4
                text: qsTr("Status")
                anchors.centerIn: parent
                color: "white"
                font.bold: true
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                       if(bw.source == normalwallpaper){
                           bw.source = rainwallpaper
                           t4.text = "Rain"
                       }
                       else if(bw.source == rainwallpaper){
                           bw.source = yellowallpaper
                           t4.text = "Sunny"
////                           t1.color ="black"
////                           t2.color ="black"
////                           t3.color ="black"
////                           t4.color ="black"
////                           l1.color ="black"
////                           l2.color ="black"
////                           l3.color ="black"
////                           l4.color ="black"
////                           r1.border.color="black"
////                           r2.border.color="black"
////                           r3.border.color="black"
////                           r4.border.color="black"
////                         console.log("Sunny")
                       }
                       else {
                           bw.source = normalwallpaper
                           t4.text = "Status"
////                           t1.color ="white"
////                           t2.color ="white"
////                           t3.color ="white"
////                           t4.color ="white"
////                           l1.color ="white"
////                           l2.color ="white"
////                           l3.color ="white"
////                           l4.color ="white"
////                           r1.border.color="white"
////                           r2.border.color="white"
////                           r3.border.color="white"
////                           r4.border.color="white"
                       }
                }
            }
        }
/******************************************Rain Rectangle******************************************/

/******************************************PNG Image******************************************/
        Image {
            id:sun
            visible: false
            source: "qrc:/Image/SunnyPng2.png"
            width: 40
            height: 40
            x:415
            y:20
        }

        Image {
            id:rainy
            visible: false
            source: "qrc:/Image/RainPng1.png"
            width: 40
            height: 40
            x:425
            y:23
        }

        Image {
            id:cold
            visible: false
            source: "qrc:/Image/TempPng.png"
            width: 40
            height: 40
            x:397
            y:20
        }
/******************************************PNG Image******************************************/

/******************************************Connect Statement******************************************/
    Connections {
        target: testing
        onNotifyAirspeed: {
          n1=ASpeed
            l1.text=n1+"m/s"
            if(l1.text<=100) {
                console.log(l1.text)
            }
            else{
                l1.text
            }
        }
    }

    Connections {
        target: testing
        onNotifyAirMoisture: {
          n2=AMoisture
            l2.text=n2+"g/m³"
            if(l2.text<=30){
                console.log("Absoluate")
            }
            else if(l2.text<=60){
                console.log("Moderate")
            }
            else if(l2.text<=100){
                console.log("Relative")
            }
            else{
                l2.text
            }
        }
    }

    Connections {
        target: testing
        onNotifyTemp: {
          n3=tem
            l3.text=n3+"°C"
            if(l4.text<=30){
                console.log("Temperature:- Cold")
                l5.text = "Cold"
                l5.color = "white"
                cold.visible = true
                rainy.visible = false
                sun.visible = false
            }
            else if(l4.text<=60){
                console.log("Temperature:- Rainy")
                l5.text = "Rainny"
                l5.color = "Skyblue"
                rainy.visible = true
                cold.visible = false
            }
            else if(l4.text<=100){
                console.log("Temperature:- Sunny")
                l5.text = "Sunny"
                l5.color = "Orange"
                sun.visible = true
                rainy.visible = false
            }
            else {
                l3.text
                cold.visible = false
                sun.visible = false
                rainy.visible = false
            }
        }
    }

    Connections {
        target: testing
        onNotifyRain: {
          n4=rain
            l4.text=n4
            if(l4.text<=30){
                bw.source=normalwallpaper
                  t4.text = "Status"
            }
            else if(l4.text<=60){
                bw.source=rainwallpaper
                t4.text = "Rainny"
            }
            else if(l4.text<=100){
                bw.source=yellowallpaper
                t4.text = "Sunny"
            }
            else{
                l4.text
              }
            }
        }
    }
}
/******************************************Connect Statement******************************************/


