import 'package:flutter/material.dart';
import 'package:stitch_hub/Screen/widgets/create_screen.dart';
import 'package:stitch_hub/Screen/widgets/notification_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Map<String, dynamic>> posts = [
    {
      'type': 'product',
      'name': 'ABC Garments',
      'profilePic':
          'https://img.freepik.com/premium-photo/front-back-views-set-black-tee-hoody-with-contemporary-design_1263357-1350.jpg',
      'time': '2h ago',
      'text':
          'High-quality cotton T-shirts available in bulk. Price per unit: \$15.',
      'image':
          'https://png.pngtree.com/png-vector/20200406/ourmid/pngtree-yellow-hoodie-vector-png-image_2170448.jpg',
      'bids': 10,
    },
    {
      'type': 'order',
      'name': 'John Doe',
      'profilePic': 'https://via.placeholder.com/50',
      'time': '1h ago',
      'text':
          'Looking for a manufacturer to produce 200 custom hoodies. Bid now!',
      'image':
          'https://st4.depositphotos.com/29283810/37817/v/450/depositphotos_378170938-stock-illustration-white-black-hoodie-front-back.jpg',
      'bids': 5,
    },
    {
      'type': 'product',
      'name': 'Sima Fashions',
      'profilePic': 'https://via.placeholder.com/50',
      'time': '3h ago',
      'text': 'সুস্বাদু কটন টি-শার্টস এর নতুন কালেকশন। দাম: ৳800 প্রতি পিস।',
      'image':
          'https://img.pikbest.com/wp/202346/blank-t-shirt-png-shirts-in-3d-on-a-white-canvas_9716272.jpg!w700wp',
      'bids': 3,
    },
    {
      'type': 'order',
      'name': 'Rina Rahman',
      'profilePic': 'https://via.placeholder.com/50',
      'time': '30m ago',
      'text': 'একটি ফ্যাশনেবল ব্ল্যাক জ্যাকেট চাই। অর্ডার দিতে পারেন!',
      'image':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQRpbMiZRy6A20ZfZAviZE5S80d7qKGZDuVA&s",
      'bids': 12,
    },
    {
      'type': 'product',
      'name': 'Unique Trends',
      'profilePic': 'https://via.placeholder.com/50',
      'time': '4h ago',
      'text':
          'New stylish hoodie collection available. Order now at a discounted price of \$20!',
      'image':
          'https://cdn.shopify.com/s/files/1/1982/7331/files/hoodie_mobile.png?v=1708689041',
      'bids': 7,
    },
    {
      'type': 'order',
      'name': 'Nazia Ahmed',
      'profilePic': 'https://via.placeholder.com/50',
      'time': '2h ago',
      'text':
          'Looking for a supplier to produce 100 custom logo T-shirts. Interested vendors, please contact me!',
      'image':
          'https://cdn.shopify.com/s/files/1/0070/7032/files/teelaunch.png?v=1710444678',
      'bids': 4,
    },
    {
      'type': 'product',
      'name': 'Elegance Wear',
      'profilePic': 'https://via.placeholder.com/50',
      'time': '5h ago',
      'text': 'স্টাইলিশ ডেনিম জ্যাকেট এখন সেল! অর্ডার করুন ১০% ডিসকাউন্টে।',
      'image':"",
      'bids': 15,
    },
    {
      'type': 'order',
      'name': 'Khaled Amin Shawon',
      'profilePic': 'https://via.placeholder.com/50',
      'time': '1h ago',
      'text':
          'Looking for a vendor who can make 150 custom-designed caps for my event. Inquire here!',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0ZRS1peGJD1n7fBcPzC0e6HHgkW3w9ZF0_w&s',
      'bids': 8,
    },
    {
      'type': 'product',
      'name': 'Trendy Threads',
      'profilePic': 'https://via.placeholder.com/50',
      'time': '6h ago',
      'text':
          'Explore our new collection of trendy shirts for men. Starting at \$25 each!',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0ZRS1peGJD1n7fBcPzC0e6HHgkW3w9ZF0_w&s',
      'bids': 9,
    },
    {
      'type': 'order',
      'name': 'Fahim Siddique',
      'profilePic': 'https://via.placeholder.com/50',
      'time': '2h ago',
      'text':
          'ব্যক্তিগত উদ্যোগে একটি ইউনিক টি-শার্ট ডিজাইন করাতে চাই। আপনার প্রস্তাব দিন!',
      'image':
          '',
      'bids': 2,
    },
  ];

  String searchQuery = "";
  bool isSearching = false;
  FocusNode searchFocusNode = FocusNode();

  void _createPost() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreatePostScreen()),
    );
  }

  void _openNotifications() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationPage()),
    );
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchQuery = ""; // Reset search query when collapsing the search bar
      }
    });
    if (isSearching) {
      searchFocusNode.requestFocus();
    } else {
      searchFocusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          children: [
            Text('StitchHub', style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            AnimatedContainer(
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(167, 255, 255, 255)),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2))],
              ),
              duration: Duration(milliseconds: 300),
              width: isSearching ? 250 : 0,
              child: TextField(
                focusNode: searchFocusNode,
                decoration: InputDecoration(
                  hintText: "Search users or posts...",
                  hintStyle: TextStyle(color: const Color.fromARGB(157, 255, 255, 255)),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: _toggleSearch, // Toggle search bar visibility
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: _openNotifications,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          if (searchQuery.isNotEmpty &&
              !posts[index]['name'].toLowerCase().contains(searchQuery) &&
              !posts[index]['text'].toLowerCase().contains(searchQuery)) {
            return Container();
          }
          return PostCard(post: posts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createPost,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final Map<String, dynamic> post;
  PostCard({required this.post});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isBidding = false;
  int bidCount = 0;

  @override
  void initState() {
    super.initState();
    bidCount = widget.post['bids'];
  }

  void toggleBid() {
    setState(() {
      isBidding = !isBidding;
      isBidding ? bidCount++ : bidCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.post['profilePic']),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.post['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(widget.post['time'],
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(widget.post['text'], style: TextStyle(fontSize: 14)),
            if (widget.post['image'] != '')
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child:
                        Image.network(widget.post['image'], fit: BoxFit.cover),
                  ),
                ),
              ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isBidding ? Colors.green : Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: toggleBid,
                  icon: Icon(Icons.gavel, color: Colors.white),
                  label: Text(
                    isBidding ? 'Bidding Accepted' : 'Place a Bid ($bidCount)',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.share, color: Colors.deepPurple),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
