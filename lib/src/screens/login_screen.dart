import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import '../bloc/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            emailField(bloc),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 25.0),),
            submitButton(bloc)
          ],
        )
    );
  }

  Widget emailField(Bloc bloc) {

    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        print('  ===> email ${snapshot.error} ');
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
            hintText: 'E-mail Address',
            labelText: 'E-mail Address',
            errorText: snapshot.error != null ? snapshot.error.toString() : null
          ),
        );
      },
    );


  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        print('password ==> ${snapshot.error}');
        return TextField(
          obscureText: true,
          onChanged: bloc.changePassword,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error != null ? snapshot.error.toString() : null
            )
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
            child: Text('Login'),
            color: Colors.blue,
            onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}