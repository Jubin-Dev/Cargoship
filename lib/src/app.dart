import 'package:flutter/material.dart';
//import 'screens/login_screen.dart';
import 'screens/login_screen_new.dart';
import 'blocs/provider.dart';
import 'screens/Init_screen.dart';
import 'screens/pregatein.dart';

class App extends StatelessWidget 
{
  build(context) 
  {
    return Provider (
      child: MaterialApp(
      title: 'Login me In!',
      home: Scaffold(
        //body: LoginScreen()
        body: LoginScreenNew()
        //body: TabsViewBar(),
        //body: PregateIn(),
      ),
    )
    );
  }
}

