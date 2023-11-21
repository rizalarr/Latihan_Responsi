import 'package:flutter/material.dart';
import 'package:latihan_kuis/api_reports.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetail3 extends StatelessWidget {
  final Results user;
  final int idUser;

  const UserDetail3({Key? key, required this.user, required this.idUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Reports'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueGrey],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias, 
              child: Image.network(
                user.imageUrl!,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "${user.title!}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              user.summary!,
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        launchUrl(Uri.parse(
           user.url ?? '',
           ));
        },
        child: Icon(Icons.search_outlined),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  try {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  } catch (e) {
    print('Error launching URL: $e');
  }
}
