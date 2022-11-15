import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

import 'Models/PostsModel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Data> postlist=[];
  Future<List<PostsModel>> getPostApi() async{
    final response = await http.get(Uri.parse('https://fz-shop.de/api/customarticle'),headers: {
      "Authorization": "Basic U2h1amE6NFRnRXNGbE8zYUo3SUdycUxzY25hUnRNd0xWZ2tXSFR3WFhyVUxIZA=="
    });
    var data  =jsonDecode(response.body.toString());
    print('status code is ${response.statusCode}');
    if(response.statusCode==200){
      print('response is ${response.body}');
      for (Map i in data['data'] ){
        postlist.add(Data.fromJson(i));
      }
      return getPostApi();
    }
    else {
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
          Expanded(child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot){
                print(snapshot.connectionState);
                if(snapshot.connectionState==ConnectionState.waiting)
                {
                  return const Text("loading");
                }
                else {
                  return ListView.builder(itemBuilder: (context,index){
                    return Container(
                      child:  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID: '+postlist[index].id.toString()),
                            Text('Name: '+postlist[index].name.toString()),
                            Text('Description: '+postlist[index].descriptionLong.toString()),
                            Text('Tax: '+postlist[index].tax.toString()),

                          ],
                        ),
                      ),

                    );

                  },itemCount: postlist.length,);
                }

              }
          ))
        ],
      ),
       floatingActionButton: FloatingActionButton(
         onPressed: (){},
         child: Text('Save'),


       ),

    );

  }
}
