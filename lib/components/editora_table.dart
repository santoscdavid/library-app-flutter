import 'package:flutter/material.dart';
import 'package:livraria_mobile/models/editora.dart';

class EditoraTable extends StatelessWidget {
  const EditoraTable(this.editoras, {Key? key}) : super(key: key);
  final Editora editoras;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    editoras.id,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      editoras.nome,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      editoras.cidade,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () => {},
                  icon:
                      const Icon(Icons.visibility_sharp, color: Colors.black),
                ),
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                    onPressed: () => {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.yellow[900],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
