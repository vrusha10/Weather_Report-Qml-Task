
#ifndef SERVICEINTERFACE_H
#define SERVICEINTERFACE_H

#include <QString>
#include <QDebug>

class serviceInterface {
public:

    virtual void airSpeed(int)=0;
    virtual void airMoisture(int)=0;
    virtual void temperature(int)=0;
    virtual void rainStatus(int)=0;

};

#endif // SERVICEINTERFACE_H


//Virtual function


//Base class//
