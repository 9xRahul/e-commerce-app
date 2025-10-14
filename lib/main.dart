import 'package:ecommerce_app/constants/size_config.dart';
import 'package:ecommerce_app/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:ecommerce_app/screens/singin_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.initialize(context);
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CartBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SignInScreen(),
      ),
    );
  }
}
