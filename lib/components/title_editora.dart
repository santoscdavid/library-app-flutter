import 'package:flutter/material.dart';

class TitleEditora extends StatelessWidget {
  const TitleEditora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.deepPurple,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Icon(
                    Icons.business_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Editoras',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.add_circle_outlined),
                  onPressed: () => {},
                ),
              ],
            ),
          ],
        ));
  }
}
