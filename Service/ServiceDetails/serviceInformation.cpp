#include "serviceInformation.h"
#include <QString>
#include <QDebug>

QTimer as,am,t,r;
static int eam = 1;
static int eas = 1;
static int et = 1;
static int er = 1;

serviceInformation::serviceInformation(QObject *parent) : QObject(parent)
{
QTimer *timer = new QTimer(this);
connect(&as, &QTimer::timeout, this, &serviceInformation::emitAirspeed);
connect(&am, &QTimer::timeout, this, &serviceInformation::emitAirMoisture);
connect(&t, &QTimer::timeout, this, &serviceInformation::emitTemp);
connect(&r, &QTimer::timeout, this, &serviceInformation::emitRain);

}


void serviceInformation::airSpeed(int ais)
{
    ais=eas;
    qDebug()<<"AirSpeed Derived: "<<ais;
}

void serviceInformation::airMoisture(int aim)
{
   aim=eam;
   qDebug()<<"AirMoisture Derived: "<<aim;
}

void serviceInformation::temperature(int at)
{
   at=et;
   qDebug()<<"Temperature Derived: "<<at;
}

void serviceInformation::rainStatus(int ar)
{
   ar=er;
   qDebug()<<"Rain Derived: "<<ar;
}


/******************************************Emit Function******************************************/
void serviceInformation::emitAirspeed()
{
    eas = eas + 1;
    if(eas<=100){
    emit notifyAirspeed(eas);
    }
    else {
        eas=0;
    }
}

void serviceInformation::emitAirMoisture()
{
    eam = eam + 1;
    if(eam<=100){
    emit notifyAirMoisture(eam);
    }
    else {
    eam=1;
    }
}

void serviceInformation::emitTemp()
{
    et = et + 1;
    if(et<=100){
    emit notifyTemp(et);
    }
    else {
    et=1;
    }
}

void serviceInformation::emitRain()
{
    er = er + 1;
    if(er<=100){
    emit notifyRain(er);
    }
    else {
    er=1;
    }
}
/******************************************Emit Function******************************************/


/******************************************Set Timer******************************************/
void serviceInformation::startTimer()
{
    as.start(500);
    am.start(1000);
    t.start(2000);
    r.start(500);
}
/******************************************Set Timer******************************************/


/******************************************Stop Timer******************************************/
void serviceInformation::stopTimer()
{
    as.stop();
    am.stop();
    t.stop();
    r.stop();
}
/******************************************Stop Timer******************************************/


/******************************************Stop Timer******************************************/
void serviceInformation::stopAirspeed()
{
   as.stop();
}

void serviceInformation::stopAirMoisture()
{
    am.stop();
}

void serviceInformation::stopTemp()
{
    t.stop();
}

void serviceInformation::stopRain()
{
    r.stop();
}
/******************************************Stop Timer******************************************/


/******************************************Start Timer******************************************/
void serviceInformation::startAirspeed()
{
    as.start();
}

void serviceInformation::startAirMoisture()
{
    am.start();
}

void serviceInformation::startTemp()
{
    t.start();
}

void serviceInformation::startRain()
{
    r.start();
}
/******************************************Start Timer******************************************/
