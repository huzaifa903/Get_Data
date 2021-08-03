import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_practise/model/user_model.dart';
import 'package:flutter_practise/services/get_user_service.dart';

// GET THE DATA/FETCHING

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DataFromApi(),
  ));
}

class DataFromApi extends StatefulWidget {
  const DataFromApi({Key? key}) : super(key: key);

  @override
  _DataFromApiState createState() => _DataFromApiState();
}

class _DataFromApiState extends State<DataFromApi> {
  late Future<List<dynamic>> userData;

  @override
  void initState() {
    super.initState();
    userData = getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: SizedBox(
          child: Card(
        child: FutureBuilder<List<dynamic>>(
          future: userData,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  User user = User.fromJson(snapshot.data![index]);
                  var styling = const TextStyle(fontSize: 15);
                  return ExpansionTile(
                    title: Text(
                      user.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                    childrenPadding: const EdgeInsets.only(left: 72),
                    children: [
                      Text(
                        "User Name : " + user.username,
                        style: styling,
                      ),
                      Text(
                        user.email,
                        style: styling,
                      ),
                      Text(
                        user.address.city,
                        style: styling,
                      ),
                      Text(
                        user.address.street,
                        style: styling,
                      ),
                      Text(
                        user.address.suite,
                        style: styling,
                      ),
                      Text(
                        user.address.zipcode,
                        style: styling,
                      ),
                      Text(
                        user.address.geo.lat,
                        style: styling,
                      ),
                      Text(
                        user.address.geo.lng,
                        style: styling,
                      ),
                      Text(
                        user.phone.toString(),
                        style: styling,
                      ),
                      Text(
                        user.website,
                        style: styling,
                      ),
                      Text(
                        user.company.name,
                        style: styling,
                      ),
                      Text(
                        user.company.catchPhrase,
                        style: styling,
                      ),
                      Text(
                        user.company.bs,
                        style: styling,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                    leading: Text(
                      user.id.toString(),
                    ),
                  );
                },
              );
            }
          },
        ),
      )),
    );
  }
}
