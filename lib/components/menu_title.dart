import 'package:flutter/material.dart';

class MenuTitle extends StatelessWidget {
  const MenuTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.bookmark),
        Text('WDA Livraria'),
      ],
    );
  }
}
