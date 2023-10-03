import 'package:flutter/material.dart';
import 'package:kuis/pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  const HalamanDetail({super.key, required this.data});
  final PokemonData data;

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            widget.data.name,
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.info_outlined,
            ),
          )
        ],
        iconTheme: IconThemeData(color: Colors.white),
        // backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.black12,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange[700],
        onPressed: () {
          _launchUrl(widget.data.wikiUrl);
        },
        child: Icon(
          Icons.travel_explore_outlined,
          color: Colors.white,
        ),
        shape: CircleBorder(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.network(
                widget.data.image,
                height: 280,
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.data.name} ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pokemon"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  String text = "";
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                  if (isFavorite == true) {
                                    text = "Berhasil menambahkan ke favorite";
                                  } else {
                                    text = "Berhasil menghapus ke favorite";
                                  }

                                  SnackBar snackBar = SnackBar(
                                    content: Text(text),
                                    backgroundColor: (isFavorite)
                                        ? Colors.green
                                        : Colors.red,
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: isFavorite
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.pinkAccent[400],
                                      )
                                    : Icon(
                                        Icons.favorite_border_outlined,
                                      ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.send_outlined,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.height,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deskripsi ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Type ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            width: 300,
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.data.type.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    " [${widget.data.type[index]}]",
                                    style: TextStyle(color: Colors.blue),
                                  );
                                })),
                        Text(
                          "Weakness ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            width: 300,
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.data.weakness.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    " [${widget.data.weakness[index]}]",
                                    style: TextStyle(color: Colors.blue),
                                  );
                                })),
                        Text(
                          "Previous Evolution ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            width: 300,
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.data.prevEvolution.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    " [${widget.data.prevEvolution[index]}]",
                                    style: TextStyle(color: Colors.blue),
                                  );
                                })),
                        Text(
                          "Next Evolution ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            width: 300,
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.data.nextEvolution.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    " [${widget.data.nextEvolution[index]}]",
                                    style: TextStyle(color: Colors.blue),
                                  );
                                })),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception("Gagal membuka url : ${_url}");
    }
  }
}
