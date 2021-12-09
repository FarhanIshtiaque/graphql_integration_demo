import 'package:flutter/material.dart';
import 'package:flutter_with_graphql/view/Home.dart';
import 'package:flutter_with_graphql/view_model/get_data_vm.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [

          ChangeNotifierProvider(create: (_) => GetDataProvider()),

        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        ));
  }
}

