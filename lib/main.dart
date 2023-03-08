

import 'package:chatgpt/Provider/chat_provider.dart';
import 'package:chatgpt/Provider/models_provider.dart';
import 'package:chatgpt/Screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Constants/constants.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
        ModelsProvider()),
        ChangeNotifierProvider(create:(_)=>
        ChatProvider())
      ],
      child: MaterialApp (
        debugShowCheckedModeBanner: false,
        title: 'ChatGPT Clone',
        theme:ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
            color: cardColor,
          ),
        ),
        home: const ChatScreen(),
      ),
    );
  }
}
