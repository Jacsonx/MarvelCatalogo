import 'package:flutter/material.dart';
import 'package:marvelcatalogo/models/models.dart';
import 'package:marvelcatalogo/services/character_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CharacterService characterService = CharacterService();
  List<Character> characters = [];

  @override
  void initState() {
    characterService.getCharacterList().then((result) {
      setState(() {
        characters = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marvel catálogo'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: characters.length > 0
            ? _criaLista(context, characters)
            : _criaLoader(),
      ),
    );
  }

  Widget _criaLoader() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _criaLista(BuildContext context, List<Character> characters) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        Character character = characters[index];
        return _criaCard(character);
      },
    );
  }

  Widget _criaCard(Character character) {
    return  GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/detalhes", arguments: character.id);

          },
          child: Card(
          child: Column(
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.png',
                image: character.thumbnail.path +
                    '.' +
                    character.thumbnail.extension,
              ),
              ListTile(
                // leading: Icon(Icons.library_music),
                title: Text(character.name),
                subtitle: Text(character.description),
                trailing: IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () => print('Gostou'),
                ),
              ),
            ],
          ),
        ),
    );
  }
}