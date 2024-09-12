import 'package:flutter/material.dart';

class CardForm extends StatelessWidget {
  const CardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                print('Card 1 ditekan!');
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Penelitian A',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print('Card 2 ditekan!');
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: const Row(
                    children: [
                      Text(
                        'Penelitian B',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print('Card 3 ditekan!');
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: const Row(
                    children: [
                      Text(
                        'Penelitian C',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print('Card 4 ditekan!');
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: const Row(
                    children: [
                      Text(
                        'Penelitian D',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print('Card 5 ditekan!');
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: const Row(
                    children: [
                      Text(
                        'Penelitian E',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print('Card 6 ditekan!');
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: const Row(
                    children: [
                      Text(
                        'Penelitian F',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print('Card 7 ditekan!');
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Container(
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: const Row(
                    children: [
                      Text(
                        'Penelitian G',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
