import "package:flutter/material.dart";
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Slidable(
              key: ValueKey(index),
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Update',
                  color: Colors.grey.shade300,
                  icon: Icons.edit,
                  closeOnTap: false,
                  onTap: () {
                    Toast.show('Update on $index', context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  },
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red.shade300,
                  icon: Icons.remove,
                  closeOnTap: true,
                  onTap: () {
                    Toast.show('Update on $index', context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  },
                )
              ],
              dismissal: SlidableDismissal(child: SlidableDrawerDismissal()),
              child: ListTile(title: Text('Achievement $index')),
            );
          }),
    );
  }
}
