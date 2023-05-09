#ifndef SERVICEINFORMATION_H
#define SERVICEINFORMATION_H

#include "serviceInterface.h"
#include <QObject>
#include <QVariant>
#include <QTimer>

class serviceInformation:public QObject,public serviceInterface
{
    Q_OBJECT

public:
    explicit serviceInformation(QObject *parent = nullptr);
    void airSpeed(int);
    void airMoisture(int);
    void temperature(int);
    void rainStatus(int);

signals:
    void notifyAirspeed(int ASpeed);
    void notifyAirMoisture(int AMoisture);
    void notifyTemp(int tem);
    void notifyRain(int rain);

private slots:
    void emitAirspeed();
    void emitAirMoisture();
    void emitTemp();
    void emitRain();

public slots:

    void startTimer();
    void stopTimer();
    void stopAirspeed();
    void stopAirMoisture();
    void stopTemp();
    void stopRain();
    void startAirspeed();
    void startAirMoisture();
    void startTemp();
    void startRain();
};

#endif // SERVICEINFORMATION_H



//Derived Class//
