import 'package:flutter/material.dart';

class CardForm extends StatelessWidget {
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
                  padding: EdgeInsets.all(16),
                  child: Text(
                        'Formulir A',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                  ),
                ),
              ),

            SizedBox(height: 10,),
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
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        'Formulir B',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

             SizedBox(height: 10,),
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
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        'Formulir C',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),
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
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        'Formulir D',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

             SizedBox(height: 10,),
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
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        'Formulir E',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

             SizedBox(height: 10,),
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
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        'Formulir F',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           

            SizedBox(height: 10,),
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
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        'Formulir G',
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
