import 'package:flutter/material.dart';
import './Item.dart';

class ContactView extends StatefulWidget {
  Item item;

  ContactView(this.item);

  @override
  _ContactViewState createState() => _ContactViewState(item);
}

class _ContactViewState extends State<ContactView> {
  Item item;

  _ContactViewState(this.item);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(item.title),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("images/dp.png"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  item.title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  item.subTitle,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(),
              ],
            ),
          )),
    );
  }
}
