import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/services/my_shared_pref.dart';
import '../../routes/app_routes.dart';

// import '../../firebase_options.dart';


class FcmHelper {
  // FCM Messaging
  static late FirebaseMessaging messaging;

  // Notification lib
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();

  /// this function will initialize firebase and fcm instance
  static Future<void> initFcm() async {
    try {
      // initialize fcm and firebase core
      await Firebase.initializeApp(
        //  only un comment this line if you set up firebase vie firebase cli
        // options: DefaultFirebaseOptions.currentPlatform,
      );
      messaging = FirebaseMessaging.instance;

      // initialize notifications channel and libraries
      await _initNotification();

      // notification settings handler
      await _setupFcmNotificationSettings();

      // generate token if it not already generated and store it on shared pref
      await _generateFcmToken();

      // background and foreground handlers
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);

      // listen to notifications clicks
      listenToActionButtons();
    } catch (error) {
      print(error);
    }
  }

  static void requestNotificationPermission()
  {

        awesomeNotifications.requestPermissionToSendNotifications();

  }
  static bool? isPermissionAllow()
  {
    awesomeNotifications.isNotificationAllowed().then((isAllowed) async {

      return isAllowed;
    });
  }

  /// when user click on notification or click on button on the notification
  static listenToActionButtons() {
    // awesomeNotifications.actionStream.listen(
    //   (ReceivedNotification receivedNotification) async {
    //     // TODO make ur actions (open screen or sth)
    //     // for ex:
    //     Get.toNamed(AppRoutes.dashboradPage);
    //   },
    // );

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (data)async {
        Get.toNamed(AppRoutes.dashboradPage);
      },
    );
  }

  ///handle fcm notification settings (sound,badge..etc)
  static Future<void> _setupFcmNotificationSettings() async {
    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    //NotificationSettings settings
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );
  }

  /// generate and save fcm token if its not already generated (generate only for 1 time)
  static Future<void> _generateFcmToken() async {
    try {
      var token = await messaging.getToken();
      if(token != null){
        print("Device token ====${token}");
        MySharedPref.setFcmToken(token);
        _sendFcmTokenToServer();
      }else {
        // retry generating token
        await Future.delayed(const Duration(seconds: 5));
        _generateFcmToken();
      }
    } catch (error) {
      // Logger().e(error);
    }
  }

  /// this method will be triggered when the app generate fcm
  /// token successfully
  static _sendFcmTokenToServer(){
    // var token = MySharedPref.getFcmToken();
    // TODO SEND FCM TOKEN TO SERVER
  }

  ///handle fcm notification when app is closed/terminated
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    _showNotification(
      id: 1,
      title: message.notification?.title ?? 'Tittle',
      body: message.notification?.body ?? 'Body',
    );
  }

  //handle fcm notification when app is open
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    _showNotification(
      id: 1,
      title: message.notification?.title ?? 'Tittle',
      body: message.notification?.body ?? 'Body',
    );
  }

  //display notification for user with sound
  static _showNotification(
      {required String title,
      required String body,
      required int id,
      String? channelKey,
      String? groupKey,
      NotificationLayout? notificationLayout,
      String? summary,
      Map<String, String>? payload,
      String? largeIcon}) async {
    awesomeNotifications.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        awesomeNotifications.requestPermissionToSendNotifications();
      } else {

        // u can show notification
        awesomeNotifications.createNotification(
          content: NotificationContent(
            id: id,
            title: title,
            body: body,
            groupKey: groupKey ?? NotificationChannels.generalGroupKey,
            channelKey: channelKey ?? NotificationChannels.generalChannelKey,
            showWhen: true, // Hide/show the time elapsed since notification was displayed
            payload: payload, // data of the notification (it will be used when user clicks on notification)
            // notificationLayout: notificationLayout, // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
            autoDismissible: true, // dismiss notification when user clicks on it
            summary: summary, // for ex: New message (it will be shown on status bar before notificaiton shows up)
            largeIcon: largeIcon, // image of sender for ex (when someone send you message his image will be shown)
          ),
        );
      }
    });
  }

  ///init notifications channels
  static _initNotification() async {
    await awesomeNotifications.initialize(
        null, // null mean it will show app icon on the notification (status bar)
        [
          NotificationChannel(
            channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelKey: NotificationChannels.generalChannelKey,
            channelName: NotificationChannels.generalChannelName,
            groupKey: NotificationChannels.generalGroupKey,
            channelDescription: 'Notification channel for general notifications',
            defaultColor: Colors.green,
            ledColor: Colors.white,
            channelShowBadge: true,
            playSound: true,
            importance: NotificationImportance.Max,
          ),
        ],

        channelGroups: [
          NotificationChannelGroup(
            channelGroupName: NotificationChannels.generalChannelGroupName, channelGroupKey: NotificationChannels.generalChannelGroupKey,
          ),

        ]);
  }

  static Future<bool> displayNotificationRationale() async {
    bool userAuthorized = false;
    BuildContext context = Get.context!;
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Get Notified!',
                style: Theme.of(context).textTheme.titleLarge),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const SizedBox(height: 20),
                const Text(
                    'Allow Tawaif app to send you notifications!?'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Deny',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () async {
                    userAuthorized = true;
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Allow',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.black),
                  )),
            ],
          );
        });
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
  }
}

class NotificationChannels {
  // chat channel (for messages only)
  static String get chatChannelKey => "chat_channel";
  static String get chatChannelName => "Chat channel";
  static String get chatGroupKey => "chat group key";
  static String get chatChannelGroupKey => "chat_channel_group";
  static String get chatChannelGroupName => "Chat notifications channels";
  static String get chatChannelDescription => "Chat notifications channels";

  // general channel (for all other notifications)
  static String get generalChannelKey => "tawaif_channel";
  static String get generalGroupKey => "basic group key";
  static String get generalChannelGroupKey => "basic_channel_group";
  static String get generalChannelGroupName => "TruthGPT public notifications channels";
  static String get generalChannelName => "TruthGPT notifications channels";
  static String get generalChannelDescription => "Notification channel for messages";
}
