import 'package:flutter/material.dart';

class MoreNewsScreen extends StatelessWidget {
  const MoreNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            // Main headline section
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // comments
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 68, 0, 186)),
                  child: const Center(child: Text('Comments')),
                ),

                const SizedBox(
                  width: 15,
                ),

                // repost
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey,
                  ),
                  child: const Center(child: Text('Reposts')),
                )
              ],
            ),
           // const Spacer(),
            // comment img
            Center(child: Image.asset('assets/newsfeed/comment.png')),

           // const Spacer(),

           // const Expanded(
              //child: 
              Center(
                child: Text('No comments yet. Be the first to comment'),
              ),
           // ),

            //const Spacer(),

            // Input for comment
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: 'Add your comment',
                  suffixIcon: const Icon(Icons.send),
                ),
              ),
            ),

           // const Spacer(),

            // Recommendations section
            const Text(
              'More like this',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Recommendations from Medial',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

           // const Spacer(),

            // // list tile
            // ListView.builder(
            //   itemBuilder: (context, index) {
                
            // },
            // ),
            ListTile(
              title: const Text(
                  'Coro, building cybersecurity for SMBs, locks down...'),
              subtitle: const Text('TechCrunch • 6mo ago'),
              trailing: Image.asset('assets/newsfeed/medial.webp'),
            ),
            ListTile(
              title: const Text('All things startups'),
              subtitle: const Text('Medial • Featured'),
              trailing: Image.asset('assets/newsfeed/medial.webp'),
            ),
          ],
        ),
      );
  }
}
