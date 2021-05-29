import 'package:bloc_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'module.dart';
import 'screen/home.dart';

void main() {
  locator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<GetcontactCubit>(
        create: (context) => getIt.call(),
        child: Home(),
      ),
    );
  }
}
