import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
                inactiveTrackColor: Colors.grey[500],
                inactiveThumbColor: const Color.fromARGB(255, 216, 214, 214),
                activeColor: Colors.orange,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.add))
            ],
          ),
          Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.upload,
                  color: Colors.red[400],
                ),
                title: Text("Sedekah"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
              )),
              Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.download,
                  color: Colors.orange,
                ),
                title: Text("Sedekah"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
