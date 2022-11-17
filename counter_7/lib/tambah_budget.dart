import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/user.dart';
import 'package:counter_7/data_budget.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class TambahBudgetPage extends StatefulWidget {

    final String title = 'Form Budget';

    // final Function(User) addUser;

    // const TambahBudgetPage({this.addUser, super.key});

    const TambahBudgetPage({super.key});

    @override
    State<TambahBudgetPage> createState() => _TambahBudgetPageState();

}

class _TambahBudgetPageState extends State<TambahBudgetPage> {
    final _formKey = GlobalKey<FormState>();
    String _judul = "";
    int _nominal = 0 ;
    String? _tipeBudget;
    final list = ['Pemasukan', 'Pengeluaran'];
    List<DropdownMenuItem<String>> _createList() {
        return list
            .map<DropdownMenuItem<String>>(
                (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
                ),
            )
            .toList();
    }



    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(title: Text('Form Budget')),
            body: Form(
                key:_formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: "Judul",                                       
                                            hintText: "Contoh: Kristo"
                                        ),
                                        onChanged: (String? value) {
                                            setState(() {
                                                _judul = value!;
                                            });
                                        },
                                        onSaved: (String? value) {
                                            setState(() {
                                                _judul = value!;
                                            });
                                        },
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'field required';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: "Nominal",
                                            hintText: "Contoh: 15000",
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (String? value) {
                                            if (value != null){
                                            setState(() {
                                                _nominal = int.parse(value);
                                            });
                                            }
                                        },
                                        onSaved: (String? value) {
                                            if (value != null){
                                            setState(() {
                                                _nominal = int.parse(value);
                                            });
                                            }
                                        },
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'field required';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField (
                                        value: _tipeBudget,
                                        hint: Text("Pilih Jenis"),
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items: _createList(),
                                        onChanged: (String? newValue) {
                                            setState(() {
                                                _tipeBudget = newValue!;
                                            });
                                        },
                                        validator: (value) => value == null ? 'field required' : null,
                                    ),
                                ),
                            ],
                            ),
                        ),
                    ),
                ),
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(left : 30),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [TextButton(
                        child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                            if(_formKey.currentState!.validate()) {
                                var temp = User(_judul!, _nominal!, _tipeBudget!);
                                UserList.userList.add(temp);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing Data')),
                                );
                            }
                        },

                    ),
                    ]
                )
            ),
            drawer: drawer(context),
        );
    }
}