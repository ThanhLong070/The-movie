import 'package:flutter/material.dart';

class TrailerHome extends StatelessWidget {
  const TrailerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390 * 1.07,
      height: 118 * 1.07,
      color: const Color.fromRGBO(3, 37, 65, 0.75),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                const Text(
                  'Latest Trailers',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color.fromRGBO(192, 254, 207, 1),
                          Color.fromRGBO(30, 213, 169, 1),
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(
                      minWidth: 120.0,
                      minHeight: 40.0,
                    ),
                    child: Row(
                      children: const <Widget>[
                        Text(
                          'On TV',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.expand_more,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "This panel didn't return any results. Try",
                    ),
                    TextSpan(
                      text: ' refreshing',
                      style: TextStyle(
                        color: Color.fromARGB(255, 1, 180, 228),
                      ),
                    ),
                    TextSpan(
                      text: ' it.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
