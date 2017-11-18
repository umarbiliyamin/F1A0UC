#include "networkmanager.h"
#include <QNetworkReply>
#include <QNetworkRequest>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QObject>

NetworkManager::NetworkManager(QObject *parent) : QObject(parent)
{

    manager= new QNetworkAccessManager();
    connect(manager,SIGNAL(finished(QNetworkReply*)), this, SLOT(replyFinished(QNetworkReply*)));
}


 //(function to load the webpage and receive timeseries data)
void NetworkManager::loadWebPage(){
    QNetworkRequest request;

    QString apikey = "2HJ6DUVQ3B4I2OQS";

    QString urlString = QString("https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_DAILY&symbol=BTC&market=HUF&apikey=%0").arg(apikey);

    QUrl url(urlString);
    request.setUrl(url);

    QNetworkReply *reply = manager->get(request);
}

//Function to deserialize JSON and obtain the key value pairs of the data of interest
//need to understand it better
void NetworkManager::replyFinished(QNetworkReply *reply)
{
    QByteArray webData = reply->readAll();

    QList<QPair<QString,QString>> graphValuesOpen;
    QList<QPair<QString,QString>> graphValuesVolume;
    //QString webDataString = QString(webData);

    QJsonDocument doc = QJsonDocument::fromJson(webData);

    if(doc.isArray()==true){
        QJsonArray rootArray = doc.array();
        //retrieve array
    }

    else if (doc.isObject() == true){

        QJsonObject rootObject = doc.object();

        QJsonObject timeSeries = rootObject["Time Series (Digital Currency Daily)"].toObject();
        QStringList keys = timeSeries.keys();

        for (QString k :keys){
            QJsonObject dayValues = timeSeries[k].toObject();
            QString openValue = dayValues["1a. open (HUF)"].toString();

            QPair<QString,QString> dataItem;
            dataItem.first = k;
            dataItem.second = openValue;

            graphValuesOpen.append(dataItem);

            }

//        for (QString k :keys){
//            QJsonObject dayValues = timeSeries[k].toObject();
//            QString volume = dayValues["5. volume"].toString();

//            QPair<QString,QString> dataItem;
//            dataItem.first = k;
//            dataItem.second = volume;

//            graphValuesVolume.append(dataItem);

//            }


//        QStringList keys = rootObject.keys();
//        for (QString k :keys){
//            QJsonObject object = rootObject[k].toObject();

//            for (QString childkey : object.keys()){

//                qDebug() << childkey;
//            }
//        }
//    }

    }
    for (int i=0; i<graphValuesOpen.size(); i++){
        QPair<QString,QString> data = graphValuesOpen[i];
        qDebug()<<data.first <<" - "<<data.second;
    }

//    for (int i=0; i<graphValuesVolume.size(); i++){
//        QPair<QString,QString> data = graphValuesVolume[i];
//        qDebug()<<data.first <<" - "<<data.second;
//    }

}

