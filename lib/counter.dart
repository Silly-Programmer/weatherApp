import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPageState());
  }
}

class LoginPageState extends StatefulWidget {
  const LoginPageState({super.key});

  @override
  State<LoginPageState> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageState> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  void setToZero() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 109, 16, 175),
        elevation: 20,
        shadowColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(child: Text("$counter", style: TextStyle(fontSize: 60))),
      floatingActionButton: FloatingActionButton(
        onPressed: setToZero,
        backgroundColor: const Color.fromARGB(255, 71, 1, 71),
        foregroundColor: Colors.white,
        child: const Icon(Icons.refresh),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        // shape: const CircularNotchedRectangle(), // gives notch
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: decrement, icon: const Icon(Icons.remove)),
            IconButton(onPressed: increment, icon: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
