import 'package:flutter/material.dart';
import 'package:livraria_mobile/components/title_editora.dart';
import 'package:livraria_mobile/provider/editora_provider.dart';
import 'package:provider/provider.dart';

class EditoraScreen extends StatefulWidget {
  const EditoraScreen({Key? key}) : super(key: key);

  @override
  _EditoraScreenState createState() => _EditoraScreenState();
}

class _EditoraScreenState extends State<EditoraScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final editoras = Provider.of<EditoraProvider>(context);
    return Column(
      children: [
        const TitleEditora(),
        FutureBuilder(
            future: editoras.loadEditoras(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Erro ao conectar com os servidores'),
                );
              }
              if (snapshot.hasData) {
                return const Text('Deu certo!!!');
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })
      ],
    );
  }
}
