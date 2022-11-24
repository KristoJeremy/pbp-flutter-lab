import 'package:counter_7/Model/my_watchlist_json.dart';
import 'package:counter_7/Page/my_watchlist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class WatchlistDetailPage extends StatefulWidget {
  const WatchlistDetailPage({Key? key}) : super(key:key);

  @override 
   _WatchlistDetail createState() => _WatchlistDetail();
}

class _WatchlistDetail extends State<WatchlistDetailPage>{
  Fields this_fields = Detail.temp;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child : Align (
                    alignment: Alignment.center, 
                    child: Column(children: [
                      Text(this_fields.movieTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          ),
                        ),         
                      ],
                    )           
                  )
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child : Column(children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Release Date: ',
                            style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        TextSpan(text: this_fields.movieReleaseDate)
                        ],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )
                      ),
                      
                    )
                  ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child : Column(children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Rating: ',
                            style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        TextSpan(text: this_fields.movieRating.toString() + '/10'),
                        ],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )
                      ),   
                    )
                  ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child : Column(children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Status: ',
                            style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        (this_fields.movieWatched == "Yes") ?  
                          TextSpan(text: "Watched") : TextSpan(text: "Unwatched"),
                        ],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )
                      ),   
                    )
                  ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Review: ", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,),
                    ),
                    SizedBox(height: 5,),
                    Text(this_fields.movieReview,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                      )
                    )
                  ],
                  )
                )
              ],
            ),
          ),     
        ]
      ),
    floatingActionButton: Padding (
      padding: const EdgeInsets.only(left: 30, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const WatchlistPage()),
              ); 
            },
            child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
          )
        ],
      ),
    ),
    );
  }

}