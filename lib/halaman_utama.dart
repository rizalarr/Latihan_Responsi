import 'package:flutter/material.dart';
import 'package:latihan_kuis/List_blogs.dart';
import 'package:latihan_kuis/List_news.dart';
import 'package:latihan_kuis/List_reports.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
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
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => listnews()),
              );
            },
            child: CardWidget('Card 1', '../assets/gambar1.jpg'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => listblogs()),
              );
            },
            child: CardWidget('Card 2', '../assets/gambar2.png'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => listreports()),
              );
            },
            child: CardWidget('Card 3', '../assets/gambar3.png'),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String cardTitle;
  final String imagePath;

  CardWidget(this.cardTitle, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              cardTitle,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
