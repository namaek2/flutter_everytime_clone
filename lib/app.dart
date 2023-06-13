import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';
import 'home_cubit.dart';
import 'login.dart';

import 'User.dart';

User user1 = User("ham", "1234", "김햄토리", "햄🐹", "전북대", "20");
User user2 = User("jsh", "1234", "전승혁", "jsh", "전북대", "19");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Everytime',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        routes: {
          '/': (context) => new Login(),
          '/start': (context) {
            return new BlocProvider(
                create: (_) => HomeCubit(), child: HomePage());
          }
        });
  }
}
