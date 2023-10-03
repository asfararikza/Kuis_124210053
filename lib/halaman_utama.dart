import 'package:flutter/material.dart';
import 'package:kuis/halaman_detail.dart';
import 'package:kuis/pokemon_data.dart';

class HalamanUtamaGrid extends StatelessWidget {
  const HalamanUtamaGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              "Pokedex",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black12,
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: listPokemon.length,
            itemBuilder: ((context, index) {
              final PokemonData pokemon = listPokemon[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HalamanDetail(data: pokemon);
                  }));
                },
                child: Card(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            pokemon.image,
                            height: 160,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                pokemon.name,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Click here for more detail",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 10),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.navigate_next_outlined,
                                size: 15,
                                color: Colors.blue,
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              );
            })));
  }
}
