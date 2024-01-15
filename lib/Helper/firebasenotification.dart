
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationClass{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


  initNotification() async {

    await _firebaseMessaging.requestPermission();
    try{
      String fcmToken=await  _firebaseMessaging.getToken()??"";
      print("=============FCM Token=============${fcmToken.toString()}");

    } on FirebaseException{
    }
// FirebaseMessaging.onBackgroundMessage(handleBackgroundMessageing);

    initPushNotification();
  }
  Future<void> handleBackgroundMessageing(RemoteMessage msg)async {

    print("title :${msg.notification?.title}");
    print("title :${msg.notification?.body}");
    print("title :${msg.data}");

  }
//user ka code background and terminate mode ke liye hai,


// neche ka code notification screen me navigate hone ke liye hai
  initPushNotification() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,


    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage)  ;
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage)  ;
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessageing)  ;

    FirebaseMessaging.onMessage.listen((msgg){

      final notificationnn=msgg.notification;
      if(notificationnn==null)
      {
        return;
      }
      else{

        _localNotificationplugin.show(notificationnn.hashCode, notificationnn.title, notificationnn.body,
          NotificationDetails(

              android: AndroidNotificationDetails(

                  _androidChannel.id,
                  _androidChannel.name,
                  channelDescription: _androidChannel.description,
                  icon: '@drawable/notiicon',
                  // sound:RawResourceAndroidNotificationSound('soundnotification'),
                  // priority: Priority.high,
                  playSound: true,

                  importance: Importance.max



              )
          ),
          payload: jsonEncode(notificationnn.toMap()),





        );

      }



    });

  }

  void handleMessage(RemoteMessage ?msg){

    if(msg==null){

      return;
    }
    else{
      // navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => Notifinationn(),));

    }
  }




// for for ground msg not enough firebase messaging we need flutter local notification


  final _androidChannel = const AndroidNotificationChannel(
    'default_notification_channel_id', 'high Notification',
    description: 'this is channel use for notification',
    importance: Importance.defaultImportance,

  );

  final _localNotificationplugin = FlutterLocalNotificationsPlugin();

}




