import 'package:flutter/material.dart';
import './bloc/provider.dart';
import './screens/login_screen.dart';

class App extends StatelessWidget {
  build(context) {
    return Provider(
      child: MaterialApp(
          title: 'log me in',
          home: Scaffold(
            body: LoginScreen(),
          )
      )
    );
  }
}