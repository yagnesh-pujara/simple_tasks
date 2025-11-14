import 'package:flutter/material.dart';
import 'package:simple_tasks/widgets/CheckBoxTile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? _checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: Text(
          'SimpleTasks',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return TodoListTile(
              title: 'Simple Task',
              checkBoxValue: _checkBoxValue,
              onChanged: (value) {
                setState(() {
                  value ??= value == false ? true : false;
                  _checkBoxValue = value;
                });
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Padding(padding: EdgeInsets.all(4.0));
          },
        ),
      ),
    );
  }
}
