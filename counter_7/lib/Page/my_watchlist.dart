import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/Model/my_watchlist_json.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/Page/watchlist_detail.dart';
import 'package:counter_7/Page/drawer.dart';


class WatchlistPage extends StatefulWidget {
    const WatchlistPage({Key? key}) : super(key: key);

    @override
    _WatchlistPage createState() => _WatchlistPage();
}

class _WatchlistPage extends State<WatchlistPage>{
  Future<List<Mywatchlist>> fetchMywatchlist() async {
    var url = Uri.parse('https://pbptugas2kristo.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers : {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      }, 
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Mywatchlist> listWatchlist = [];
        for (var d in data) {
        if (d != null) {
            listWatchlist.add(Mywatchlist.fromJson(d));
        }
        }

    return listWatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
      ),
      drawer: drawer(context),
      body: FutureBuilder(
        future: fetchMywatchlist(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          else{
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text("Tidak ada watchlist", 
                    style: TextStyle(
                      color: Color(0xff59A5D8),
                      fontSize: 20),
                    ),
                  SizedBox(height: 8),
                ],
              );
            }
            else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index)=> Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Detail._temp = snapshot.data![index].fields;
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => const WatchlistDetailPage()),
                            );
                        },
                        child: Column(
                          children: [
                            Text(
                              "${snapshot.data![index].fields.movieTitle}",
                              style:  const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ), 
                    ],
                  ),
                )
              );
            }
          }
        }
      ),
    );
  }
}

class Detail {
  static late Fields _temp;
  static Fields get temp => _temp;
}