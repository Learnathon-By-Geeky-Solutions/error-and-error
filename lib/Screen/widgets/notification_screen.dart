import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, dynamic>> notifications = [
    {"title": "New Product Added", "message": "ABC Garments just uploaded a new T-shirt. Check it out!", "time": DateTime.now().subtract(Duration(minutes: 5)), "isRead": false},
    {"title": "Order Confirmation", "message": "Your order for 3 custom T-shirts has been confirmed.", "time": DateTime.now().subtract(Duration(hours: 1)), "isRead": false},
    {"title": "Bid Accepted", "message": "Your bid on custom hoodies has been accepted by the seller.", "time": DateTime.now().subtract(Duration(days: 1)), "isRead": true},
    {"title": "Message from Seller", "message": "Michael has sent you a message regarding your order.", "time": DateTime.now().subtract(Duration(days: 2)), "isRead": true},
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
        backgroundColor: Colors.deepPurple, // Using StitchHub's primary color
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            color: notification['isRead'] ? Colors.white : Colors.deepPurple[50], // Modify color for unread notifications
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(
                notification['isRead'] ? Icons.notifications_none : Icons.notifications_active,
                color: notification['isRead'] ? Colors.grey : Colors.deepPurple,
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
