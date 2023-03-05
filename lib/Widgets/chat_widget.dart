import 'package:chatgpt/Constants/constants.dart';
import 'package:chatgpt/Services/assets_manager.dart';
import 'package:chatgpt/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key, required this.msg, required this.chatIndex}) : super(key: key);

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Material(
         color: chatIndex ==0 ? scaffoldBackgroundColor: cardColor,
         child:  Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Image.asset(
                 chatIndex ==0 ?
                 AssetManager.userImage:
                 AssetManager.botImage,
                 height: 30,
                 width: 30,
               ),
              const SizedBox(
                width: 10,
              ),
               Expanded(
                   child: TextWidget(
                   label:msg
               )
               ),
               chatIndex ==0 ?
                   const SizedBox.shrink():
                  Expanded(
                      child:  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.thumb_up_alt_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                        height: 5,
                      ),
                      Icon(
                        Icons.thumb_down_alt_rounded,
                        color: Colors.white,
                      )
                    ],
                  ))
             ],
           ),),
       )
      ],
    );
  }
}
