import 'package:assignment_test/api/shared_pref.dart';
import 'package:assignment_test/constants/color.dart';
import 'package:assignment_test/home.dart';
import 'package:flutter/material.dart';

import 'api/apiservices.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FutureBuilder<bool?>(
          future: SharedPref.isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error"));
            } else {
              if (snapshot.data != null) {
                return HomeScreen();
              } else {
                return const Home();
              }
            }
          }),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _posts = [];
  bool showData = false;
  @override
  void initState() {
    super.initState();
    ApiSevices.getPosts().then((value) {
      print(value);
      if (value.isNotEmpty) {
        value['result'].forEach((element) {
          // _posts.add(Result.fromJson(element));
          showData = true;
          setState(() {});
        });
      } else {
        showData = true;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('Home'),
      ),
      body: showData
          ? _posts.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(_posts[index].title!),
                            subtitle: Text(_posts[index].description!),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(_posts[index].imgpath!),
                            ),
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  },
                  itemCount: _posts.length)
              : const Text('No Data')
          : Center(
              child: CircularProgressIndicator(
                color: mainColor,
              ),
            ),
    );
  }
}
