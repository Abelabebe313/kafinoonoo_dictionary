import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:project01/navigationDrawer.dart';
import 'package:project01/search.dart';
import 'package:project01/wordsJSON.dart';
import 'package:project01/screens/favoritePage.dart';
import 'package:project01/search.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<wordsJSON>> ReadJsonData() async {
  final jsondata = await rootBundle.loadString('jsonFile/wordsJSON.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => wordsJSON.fromJson(e)).toList();
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kafinoonoo Dictionary'),
        backgroundColor: Colors.brown.shade900,
        // leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: searchWord());
            },
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text('${data.error}'));
          } else if (data.hasData) {
            var items = data.data as List<wordsJSON>;
            return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(items[index].kafigna.toString()),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(items[index].amharic.toString()),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(items[index].english.toString()),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: _AddButton(
                            kafigna: items[index].kafigna.toString(),
                            amharic: items[index].amharic.toString(),
                            english: items[index].english.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _AddButton extends StatefulWidget {
  final String kafigna;
  final String amharic;
  final String english;
  const _AddButton(
      {Key? key,
      required this.kafigna,
      required this.amharic,
      required this.english})
      : super(key: key);

  @override
  __AddButtonState createState() => __AddButtonState();
}

setFavorite(String kafigna, String amharic, String english) {
  addToFavorite(kafigna, amharic, english);
  // showToast();
}

// void showToast() => Fluttertoast.showToast(
//       msg: 'ቃሉ በተሳካ ሁኔታ ገብቷል።',
//       fontSize: 18,
//       gravity: ToastGravity.TOP,
//     );

class __AddButtonState extends State<_AddButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite_border,
      ),
      onPressed: (() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('ይህንን ቃል ወደ ምርጫዎ (Favorite) ማስገባት ይፍልጋሉ?'),
            actions: [
              TextButton(
                onPressed: () {
                  setFavorite(widget.kafigna, widget.amharic, widget.english);
                  Navigator.of(context).pop();
                },
                child: Text('አዎ'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('አይ'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
