import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, dynamic>> notifications = [
    {"title": "New Friend Request", "message": "John Doe sent you a friend request.", "time": DateTime.now().subtract(Duration(minutes: 5)), "isRead": false},
    {"title": "New Message", "message": "Jane: Hey! How are you?", "time": DateTime.now().subtract(Duration(hours: 1)), "isRead": false},
    {"title": "Group Invite", "message": "You have been invited to Flutter Devs group.", "time": DateTime.now().subtract(Duration(days: 1)), "isRead": true},
    {"title": "Tagged in a Post", "message": "Michael tagged you in a post.", "time": DateTime.now().subtract(Duration(days: 2)), "isRead": true},
  ];

  void markAsRead(int index) {
    setState(() {
      notifications[index]['isRead'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            color: notification['isRead'] ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Icon(
                notification['isRead'] ? Icons.notifications_none : Icons.notifications_active,
                color: notification['isRead'] ? Colors.grey : Colors.blue,
              ),
              title: Text(notification['title'], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification['message']),
                  SizedBox(height: 5),
                  Text(
                    DateFormat('MMM d, hh:mm a').format(notification['time']),
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              onTap: () => markAsRead(index),
            ),
          );
        },
      ),
    );
  }
}
