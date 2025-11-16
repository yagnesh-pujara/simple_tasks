import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  TodoListTile({
    super.key,
    required this.title,
    this.checkBoxValue,
    required this.onChanged,
  });

  bool? checkBoxValue;
  final String title;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          //    LIST CHECKBOX
          Checkbox(value: checkBoxValue ?? false, onChanged: onChanged),

          //    LIST TITLE
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              decoration: checkBoxValue ?? false
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
            maxLines: 6,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
