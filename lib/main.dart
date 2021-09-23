import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api/create_account_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ACT Money Transfer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ACT Money Transfer'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // STATE - variable
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? firstName, middleName, lastName, phoneNumber, email, pin, confirmPin;

  void _handleButtonPress() {
    print(
        "$firstName $middleName $lastName $phoneNumber $email $pin $confirmPin");

    if (pin == confirmPin) {
      final data = createAccount(firstName!, middleName, lastName, phoneNumber, email, pin,
          confirmPin);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Account created successfully!")));
    } else {
      print('Pin and confirm pin are not the same.');
      throw Exception('Pin and confirm pin are not the same.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("First name"),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.name,
                onChanged: (String value) {
                  firstName = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Middle name"),
              TextField(
                keyboardType: TextInputType.name,
                onChanged: (String value) {
                  middleName = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Last name"),
              TextField(
                keyboardType: TextInputType.name,
                onChanged: (String value) {
                  lastName = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Phone number"),
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (String value) {
                  phoneNumber = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Email"),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Pin"),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  pin = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Confirm Pin"),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  confirmPin = value;
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: _handleButtonPress,
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
