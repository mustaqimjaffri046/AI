import 'package:flutter/material.dart';
import './Item.dart';

class ContactsView extends StatefulWidget {
  Function addItem;
  ContactsView(this.addItem);

  @override
  _ContactViewState createState() => _ContactViewState(addItem);
}

class _ContactViewState extends State<ContactsView> {
  Function addItem;

  String title = '';
  String subTitle = '';

  _ContactViewState(this.addItem);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Add Contact'),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    title = value;
                  },
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter name"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    subTitle = value;
                  },
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter contact number "),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (title.length > 0 && subTitle.length > 0) {
                        addItem(Item(title, subTitle));
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add'))
              ],
            ),
          )),
    );
  }
}
