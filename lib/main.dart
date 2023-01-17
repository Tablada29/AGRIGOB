import 'package:agrogob/Home/Start.dart';
import 'package:agrogob/provider/user_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//En esta sección se presentan el enroutamiento de la apliacion

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => UserMode(),
          child: MaterialApp(
              debugShowCheckedModeBanner: false, //Para quitar modo debug
              title: 'AGROGOB',
              initialRoute: '/',
              routes: {
                '/': (context) => Startful(),
              },
            ),
    );
  }
}


