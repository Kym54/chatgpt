

 import 'dart:ui';

import 'package:chatgpt/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

Color scaffoldBackgroundColor = const Color(0xFF343541);
Color cardColor = const Color(0xFF444654);

/*List<String> models = [
 "Model1",
 "Model2",
 "Model3",
 "Model4",
 "Model5",
 "Model6",
];

List<DropdownMenuItem<String>>? get getModelsItem{
 List<DropdownMenuItem<String>>? modelsItems=
 List<DropdownMenuItem<String>>.generate(models.length, (index) =>
     DropdownMenuItem(
         value: models[index],
         child: TextWidget(
      label: models[index],
     fontSize: 15,)
     )
 );
 return modelsItems;
}

 */


final chatMessages = [
 {
  "msg": 'Hello who are you',
  "chatIndex":0
 },
 {
  "msg": 'Hello I am ChatGPT, a language model developed by OpenAI, I am here too assist you',
  "chatIndex":1
 },
 {
  "msg": 'What is Flutter',
  "chatIndex":0
 },
 {
  "msg":
  'Flutter is an opensource mobile application development framework created by Google.It allows developers to build high-quality, cross-platform apps for iOS and Android using a single codebase. Flutter is known for its fast development cycle, expressive and flexible UI, and high performance.',
  "chatIndex":0
 },
 {
  "msg":
      'Okay, thanks',
  "chatIndex":0
 },
 {
  "msg":
      "You're welcome! If you have any questions or need any help, feel free to ask!",
  "chatIndex":1
 }

];