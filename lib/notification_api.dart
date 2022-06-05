import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> createPlantFoodNotitfication() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id:4,
        channelKey: 'basic_channel',
        title: 'a',
        body: 'FUCK FUCK FUCK',
        bigPicture: 'asset://assets/notification_map.png',
        notificationLayout: NotificationLayout.BigPicture
      ),
  );
}