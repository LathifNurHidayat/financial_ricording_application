import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

bool isSwitch = true;
List<String> listCategory = ["Makanan", "Minuman", "Snack"];
String? selectedCategory;
TextEditingController dateControler = TextEditingController();

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaksi",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Switch(
                    value: isSwitch,
                    onChanged: (bool value) {
                      setState(() {
                        isSwitch = value;
                      });
                    },
                    inactiveTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.white,
                    activeColor: Colors.orange,
                  ),
                  SizedBox(width: 20),
                  Text(
                    (isSwitch) ? "Pemasukan" : "Pengeluaran",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Jumlah Transaksi",
                    prefixText: "Rp"),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Kategori"),
                  hint: Text(
                    "Pilih Category",
                    style: GoogleFonts.montserrat(fontSize: 16),
                  ),
                  value: selectedCategory,
                  isExpanded: true,
                  items: listCategory
                      .map<DropdownMenuItem<String>>((String Category) {
                    return DropdownMenuItem<String>(
                        value: Category, child: Text(Category));
                  }).toList(),
                  onChanged: (String? Category) {
                    setState(() {
                      selectedCategory = Category;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              TextField(
                readOnly: true,
                controller: dateControler,
                decoration: InputDecoration(
                    labelText: "Pilih Tanggal", border: OutlineInputBorder()),
                onTap: () async {
                  DateTime? selectDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2999));

                  if (selectDate != null) {
                    String FormatDatetime =
                        DateFormat('dd/MM/yyyy').format(selectDate);

                    dateControler.text = FormatDatetime;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Detail", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(5, 8)))),
                    onPressed: () {},
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          )),
        ),
      ),
    );
  }
}
