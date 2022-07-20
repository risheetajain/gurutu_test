import 'package:assignment_test/api/apiservices.dart';
import 'package:flutter/material.dart';

import 'api/shared_pref.dart';
import 'constants/color.dart';
import 'login.dart';
import 'modals/usermodal.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;
  List<UserModel>? list = [];
  @override
  void initState() {
    _loadFromApi("cancer");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gurutu'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Are you sure?"),
                          content: const Text("Do you want to logout?"),
                          actions: [
                            ElevatedButton(
                              child: const Text("Yes"),
                              onPressed: () {
                                SharedPref.clearSharedPref().then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                });
                              },
                            ),
                            ElevatedButton(
                              child: const Text("No"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ));
              })
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : list!.isNotEmpty
              ? _buildEmployeeListView()
              : const Center(child: Text('No Data Found')),
    );
  }

  _loadFromApi(String query) async {
    setState(() {
      isLoading = true;
    });
    list = await ApiSevices.getBooks();

    setState(() {
      isLoading = false;
    });
  }

  _buildEmployeeListView() {
    return ListView.builder(
      itemCount: list!.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int index) {
        return Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: mainColor,
                  width: 1,
                ),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 1.0, offset: Offset(0, 0), spreadRadius: 1.0)
                ],
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    list![index].title.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(list![index].body ?? ""),
                ],
              ),
            ));
      },
    );
  }
  // }

}
