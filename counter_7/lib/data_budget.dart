import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/user.dart';
import 'package:counter_7/tambah_budget.dart';

void main() {
  runApp(const MyApp());
}

class DataBudgetPage extends StatefulWidget {
    const DataBudgetPage({super.key});

    final String title = 'Data Budget';

    @override
    State<DataBudgetPage> createState() => _DataBudgetPageState();
    
}

class _DataBudgetPageState extends State<DataBudgetPage> {
    // List<User> userBudget = [];

    // void addUserData({required User user}){
    //     setState(() {
    //         userBudget.add(user);
    //     });
    // }
    
    var data = UserList.userList;

    @override
    Widget build(BuildContext context) {


        return Scaffold(
            appBar: AppBar(
                title: Text('Data Budget'),
            ),
            drawer: Drawer(
                child: Column(
                    children: [
                    ListTile(
                        title: const Text('Counter'),
                        onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyHomePage()),
                        );
                        },
                    ),
                    ListTile(
                        title: const Text('Tambah Budget'),
                        onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const TambahBudgetPage()),
                        );
                        },
                    ),
                    ListTile(
                        title: const Text('Data Budget'),
                        onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const DataBudgetPage()),
                        );
                        },
                    ),
                    ],
                ),
            ),
            body: Container(
                height: MediaQuery.of(context).size.height * 0.75, 
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (ctx, index){
                    return Card(child: ListTile(
                        title: 
                            Text(data[index].judul, style: const TextStyle(fontSize: 28)),
                        subtitle:
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(data[index].nominal.toString()),
                                    Text(data[index].tipeBudget)
                                ],
                            )
                        ),
                    );
                }, 
            )
            ),
        );
    }
}

