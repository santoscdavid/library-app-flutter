import 'package:flutter/material.dart';
import 'package:livraria_mobile/components/editora_table.dart';
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
                return Expanded(
                  child: SizedBox(
                    height: 450,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (ctx, i) =>
                              EditoraTable(snapshot.data[i])),
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })
      ],
    );
  }
}
