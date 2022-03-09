// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_is_empty

import 'package:flutter/material.dart';
import './Item.dart';
import 'ContactsView.dart';
import 'ContactView.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String title = '';
  String subtitle = '';

  List<Item> items = [];
  _AppState() {
    items.add(Item("Faisal", "+9212345678"));
    items.add(Item("Abbas", "+92187654654"));
    items.add(Item("Waleed", "+92184554564"));
  }

  TextEditingController clear = TextEditingController();
  TextEditingController clear2 = TextEditingController();
  void clearForm() {
    clear.clear();
    clear2.clear();
  }

  void addItem(Item item) {
    items.add(item);
    setState(() {});
  }

  void deleteItem(Item item) {
    items.remove(item);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contacts",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: items.length > 0
              ? ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ContactView(items[index]);
                          }));
                        },
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("images/dp.png"),
                        ),
                        title: Text(items[index].title),
                        subtitle: Text(items[index].subTitle),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteItem(items[index]);
                          },
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "Contacts list is empty",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactsView(addItem)));
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.add),
            );
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
