import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'link_bloc/link_bloc.dart';
import 'link_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LinkBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LinkView(),
      ),
    );
  }
}
