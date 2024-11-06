import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool _switchValue = false;

  void OpenDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      (_switchValue)
                          ? "Tambah Pemasukan"
                          : "Tambah Pengeluaran",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              (_switchValue) ? Colors.orange : Colors.red[400]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Tambahkan Data"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (_switchValue) ? Colors.orange : Colors.red[400],
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(5, 8)),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Simpan",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ), 
              ),
            ),
          );
        });
  } 

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
              IconButton(
                  onPressed: () {
                    OpenDialog();
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          Card(
              elevation: 10,
              child: ListTile(
                leading: (_switchValue)
                    ? Icon(
                        Icons.download,
                        color: Colors.orange,
                      )
                    : Icon(
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
                leading: (_switchValue)
                    ? Icon(
                        Icons.download,
                        color: Colors.orange,
                      )
                    : Icon(
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
        ],
      ),
    ));
  }
}
