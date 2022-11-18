import 'dart:convert';
import 'package:api_to_database/Models/showDatabase.dart';
import 'package:flutter/material.dart';
import 'dbhelper.dart';
import 'package:http/http.dart' as http;
import 'package:slider_button/slider_button.dart';
import 'Models/PostsModel.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Data> postlist = [];
  Future<List<PostsModel>> getPostApi() async {
    final response = await http
        .get(Uri.parse('https://fz-shop.de/api/customarticle'), headers: {
      "Authorization":
          "Basic U2h1amE6NFRnRXNGbE8zYUo3SUdycUxzY25hUnRNd0xWZ2tXSFR3WFhyVUxIZA=="
    });
    var data = jsonDecode(response.body.toString());
    print('status code is ${response.statusCode}');
    if (response.statusCode == 200) {
      print('response is ${response.body}');
      for (Map i in data['data']) {
        postlist.add(Data.fromJson(i));
      }
      return getPostApi();
    } else {
      return getPostApi();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api to Database'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getPostApi(),
                  builder: (context, snapshot) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child :CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ID: ${postlist[index].id}'),
                                Text('Name: ${postlist[index].name}'),
                                Text(
                                    'Description: ${postlist[index].descriptionLong}'),
                                Text('Price: ${postlist[index].tax}'),
                                Divider(
                                  color: Colors.black45,
                                  thickness: 2,

                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: postlist.length,
                      );
                    }
                  })),
          InkWell(
            onTap: () async {
              for (var i = 0; i < postlist.length; i++) {
                print(await DBHelper().add(postlist[i].toJsonDB()));
                await DBHelper().add(postlist[i].toJsonDB());
              }
              final snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Success!',
                  message: 'Data Saved',
                  contentType: ContentType.success,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);

              //DBHelper().add();
            },
            child: Container(
              height: 40,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text('Save Data')),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: SliderButton(
            action: () {

              Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDatabase()));
            },
            label: Text(
              "Slide to Show Data",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            icon: Text(
              "x",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 44,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
