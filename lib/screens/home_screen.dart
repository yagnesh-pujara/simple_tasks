import 'package:flutter/material.dart';
import 'package:simple_tasks/models/todo_item_model.dart';
import 'package:simple_tasks/widgets/TodoListTile.dart';

import '../widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoItem> list = [
    TodoItem(todoTitle: 'Read a book for 20 minutes', todoValue: false),
    TodoItem(todoTitle: 'Complete Flutter training', todoValue: true),
    TodoItem(todoTitle: 'Pay electricity bill', todoValue: false),
    TodoItem(todoTitle: 'Practice coding for 1 hour', todoValue: false),
  ];

  final _todoController = TextEditingController();

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListView.separated(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return TodoListTile(
                title: list[index].todoTitle,
                checkBoxValue: list[index].todoValue,
                onChanged: (value) {
                  setState(() {
                    value ??= value == false ? true : false;
                    list[index].todoValue = value!;
                  });
                },
              );
            },
            separatorBuilder: (context, index) {
              return const Padding(padding: EdgeInsets.all(4.0));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            useSafeArea: true,
            builder: (context) {
              return Dialog(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  Title Text
                      Text(
                        'SimpleTasks',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 4.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      TextFormField(
                        controller: _todoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(width: 3.0),
                          ),
                          hintText: 'Add Your Todo Title...',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 8.0),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonWidget(
                              buttonText: 'Cancel',
                              btnBorderRadius: 4.0,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              onPressed: () {
                                _todoController.clear();
                                Navigator.pop(context);
                              },
                              fontColor: Colors.white,
                              btnBackgroundColor: Colors.deepPurple.shade500,
                              side: BorderSide.none,
                            ),
                            const SizedBox(width: 16.0),
                            ButtonWidget(
                              buttonText: 'Success',
                              fontColor: Colors.white,
                              onPressed: () {
                                final String value = _todoController.text;
                                setState(() {
                                  list.add(
                                    TodoItem(
                                      todoTitle: value,
                                      todoValue: false,
                                    ),
                                  );
                                });
                                _todoController.clear();
                                Navigator.pop(context);
                              },
                              btnBorderRadius: 4.0,
                              side: BorderSide.none,
                              btnBackgroundColor: Colors.deepPurple.shade500,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
