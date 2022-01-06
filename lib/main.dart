import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cont = 0;
  void decrement() {
    setState(() {
      cont--;
    });
  }

  void imcrement() {
    setState(() {
      cont++;
    });
  }

  bool get IsEmpty => cont == 0;
  bool get IsFull => cont == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/rest.jpg'),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              IsFull ? "Lotado!" : "Pode entrar!",
              style: TextStyle(
                fontSize: 30,
                color: IsFull ? Colors.red : Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                cont.toString(),
                style: TextStyle(
                  fontSize: 100,
                  color: IsFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: IsEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )),
                  onPressed: IsEmpty ? null : decrement,
                  child: const Text(
                    "Saiu",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: IsFull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )),
                  onPressed: IsFull ? null : imcrement,
                  child: const Text(
                    "Entrou",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


