import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class ForumPage extends StatefulWidget {
//   @override
//   _ForumPageState createState() => _ForumPageState();
// }

// class _ForumPageState extends State<ForumPage> {
//   final TextEditingController postController = TextEditingController();
//   final TextEditingController userController = TextEditingController();
//   List<Map<String, dynamic>> posts = [];

//   void addPost(String username, String content) {
//     setState(() {
//       posts.add({
//         'username': username,
//         'content': content,
//         'comments': [""],
//         'timestamp': DateTime.now()
//       });
//     });
//     postController.clear();
//     userController.clear();
//   }

//   void addComment(int postIndex, String comment) {
//     setState(() {
//       posts[postIndex]['comments']
//           .add({'comment': comment, 'timestamp': DateTime.now()});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Forum Page'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: postController,
//               decoration: InputDecoration(
//                 labelText: 'Add a post',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () => addPost("UserNAME", postController.text),
//               child: Text('Post'),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: posts.length,
//                 itemBuilder: (context, index) {
//                   return PostTile(
//                     timestamp: DateTime.now(),
//                     username: "UserNma",
//                     content: posts[index]['content'],
//                     comments: posts[index]['comments'],
//                     onComment: (comment) => addComment(index, comment),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final TextEditingController postController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  List<Map<String, dynamic>> posts = [];

  void addPost(String username, String content) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User user = _auth.currentUser!;

    setState(() {
      posts.add({
        'username': user!.email,
        'content': content,
        'comments': [
          {'comment': "comment", 'timestap': DateTime.now()}
        ],
        'timestamp': DateTime.now()
      });
    });
    postController.clear();
    userController.clear();
  }

  void addComment(int postIndex, String comment) {
    setState(() {
      posts[postIndex]['comments']
          .add({'comment': comment, 'timestamp': DateTime.now()});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forum'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: postController,
              decoration: InputDecoration(
                labelText: "Ungependa kujadili nin?",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  addPost(userController.text, postController.text),
              child: Text('Chapisha'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostTile(
                    username: posts[index]['username'],
                    content: posts[index]['content'],
                    comments: posts[index]['comments'],
                    timestamp: posts[index]['timestamp'],
                    onComment: (comment) => addComment(index, comment),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class PostTile extends StatefulWidget {
//   final String content;
//   final List<String> comments;
//   final Function(String) onComment;

//   const PostTile({
//     required this.content,
//     required this.comments,
//     required this.onComment,
//   });

//   @override
//   _PostTileState createState() => _PostTileState();
// }

// class _PostTileState extends State<PostTile> {
//   final TextEditingController commentController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.content,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: commentController,
//               decoration: InputDecoration(
//                 labelText: 'Add a comment',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: () {
//                 widget.onComment(commentController.text);
//                 commentController.clear();
//               },
//               child: Text('Comment'),
//             ),
//             ...widget.comments.map(
//               (comment) => Padding(
//                 padding: const EdgeInsets.only(top: 4.0),
//                 child: Text("- $comment"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// // }

// class PostTile extends StatefulWidget {
//   final String username;
//   final String content;
//   final List<String> comments;
//   final Function(String) onComment;

//   const PostTile({
//     required this.username,
//     required this.content,
//     required this.comments,
//     required this.onComment,
//   });

//   @override
//   _PostTileState createState() => _PostTileState();
// }

// class _PostTileState extends State<PostTile> {
//   final TextEditingController commentController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       color: Colors.blue.shade100,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.username,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue.shade800,
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               widget.content,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.blue.shade900,
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: commentController,
//               decoration: InputDecoration(
//                 labelText: 'Add a comment',
//                 border: OutlineInputBorder(),
//                 filled: true,
//                 fillColor: Colors.blue.shade50,
//               ),
//             ),
//             SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: () {
//                 widget.onComment(commentController.text);
//                 commentController.clear();
//               },
//               child: Text('Comment'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue.shade700,
//               ),
//             ),
//             ...widget.comments.map(
//               (comment) => Padding(
//                 padding: const EdgeInsets.only(top: 4.0),
//                 child: Text(
//                   "- $comment",
//                   style: TextStyle(color: Colors.blue.shade800),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class PostTile extends StatefulWidget {
  final String username;
  final String content;
  final List<Map<String, dynamic>> comments;
  final DateTime timestamp;
  final Function(String) onComment;

  const PostTile({
    required this.username,
    required this.content,
    required this.comments,
    required this.timestamp,
    required this.onComment,
  });

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String formattedTime = widget.timestamp.toString();
    // DateFormat('hh:mm a, MMM d').format(widget.timestamp);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.blue[100],
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade700,
                  child: Text(widget.username[0].toUpperCase(),
                      style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      formattedTime,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              widget.content,
              style: TextStyle(fontSize: 16, color: Colors.blue.shade900),
            ),
            SizedBox(height: 10),
            TextField(
              controller: commentController,
              decoration: InputDecoration(
                labelText: 'Add a comment',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.blue.shade50,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                widget.onComment(commentController.text);
                commentController.clear();
              },
              child: Text('Comment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
              ),
            ),
            ...widget.comments.map((commentData) {
              String commentTime = DateTime.now()
                  .toString(); //DateFormat('hh:mm a').format(commentData['timestamp']);
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.comment, size: 16, color: Colors.blue.shade700),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        "${commentData['comment']} - $commentTime",
                        style: TextStyle(color: Colors.blue.shade800),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
