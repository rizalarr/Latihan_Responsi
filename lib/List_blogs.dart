import 'package:flutter/material.dart';
import 'package:latihan_kuis/api_blogs.dart';
import 'package:latihan_kuis/api_data_source.dart';
import 'package:latihan_kuis/detail_blogs.dart';


class listblogs extends StatefulWidget {
  const listblogs({Key? key});

  @override
  State<listblogs> createState() => _listblogsState();
}

class _listblogsState extends State<listblogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List blogs'),
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
      body: FutureBuilder(
        future: ApiDataSource.instance.loadBlog(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error bro'),
            );
          }
          if (snapshot.hasData) {
            Blogs users = Blogs.fromJson(snapshot.data!);
            return ListView.builder(
              itemCount: users.results!.length,
              itemBuilder: (context, index) {
                var usr = users.results![index];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 3,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    tileColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UserDetail2(
                              user: usr,
                              idUser: usr.id!,
                            );
                          },
                        ),
                      );
                    },
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(usr.imageUrl!),
                        ),
                      ),
                    ),
                    title: Text(
                      "${usr.title!}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}