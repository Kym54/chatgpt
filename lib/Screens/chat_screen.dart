import 'package:chatgpt/Constants/constants.dart';
import 'package:chatgpt/Services/api_services.dart';
import 'package:chatgpt/Services/services.dart';
import 'package:chatgpt/Widgets/chat_widget.dart';
import 'package:chatgpt/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Services/assets_manager.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;
  late TextEditingController textEditingController;

  @override
  void initState(){
    textEditingController=TextEditingController();
        super.initState();
  }
  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
              AssetManager.openAI,
          height: 15,
          width: 15,
          ),
        ),
        title: const Text('ChatGPT'),
        actions: [IconButton(onPressed: ()async{
          await Services.showModalSheet(context: context);
    },
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            )
    )],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ChatWidget(
                        msg: chatMessages[index]["msg"].toString(),
                        chatIndex: int.parse(chatMessages[index]["chatIndex"].toString()),
                      );
                    })),
            if(_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(height: 15,),
              Material(
                color: cardColor,

                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: TextField(
                        style: const TextStyle(
                            color: Colors.white
                        ),
                        controller: textEditingController,
                        onSubmitted: (value){
                          // TODO send message
                        },
                        decoration:const InputDecoration.collapsed(hintText:'How can i help you',hintStyle: TextStyle(
                            color: Colors.grey
                        )),
                      )),
                      IconButton(onPressed: () async{
                        try{
                          await ApiServices.getModels();
                        }catch(error){
                          print("error $error");
                        }
                      },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
