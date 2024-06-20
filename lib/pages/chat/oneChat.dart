import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyChatController.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/chatUtills.dart';
import 'package:trener_app/models/chat.dart';
import 'package:trener_app/modules/chats/chatIcon.dart';
import 'package:trener_app/pages/chat/message.dart';
import 'package:trener_app/service/helpers/getChatName.dart';
import 'package:trener_app/widgets/app_bar/gradient_appbar.dart';
import 'package:trener_app/widgets/inputs/input_inline_fill.dart';
import 'package:trener_app/widgets/text/title.dart';
import 'package:socket_io_client_flutter/socket_io_client_flutter.dart' as IO;

class OneChat extends StatefulWidget {
  const OneChat({super.key});

  @override
  State<OneChat> createState() => _OneChatState();
}

class _OneChatState extends State<OneChat> {
  MyUserController myUserController = Get.put(MyUserController());
  MyChatController myChatController = Get.put(MyChatController());
  final TextEditingController messageController = TextEditingController();
  // final ScrollController _scrollController = ScrollController();
  final chatUtills = ChatUtills();
  final Chat chat = Get.arguments;
  IO.Socket _socket = IO.io('https://mobilecoach.ru:4000',IO.OptionBuilder().setTransports(['websocket']).build());

  @override
  void initState() {
    super.initState();
    chatUtills.getChatById(chat.chat.id);
    _connectSocket();
    // // Прокрутка вниз после загрузки данных
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollToBottom();
    // });
  }


// void _scrollToBottom() {
//     if (_scrollController.hasClients) {
//       _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//     }
//   }


  _connectSocket(){
    _socket.onConnect((data) => debugPrint('Соединено'));
    _socket.onConnectError((data) => debugPrint('Ошибка соединения'));
    _socket.onDisconnect((data) => debugPrint('Отключние'));
    _socket.on('message',(data)=>print(data));
  }


  void setMessage() {
    _socket.emit('message', [messageController.text.trim(),chat.chat.id,myUserController.user['id']]
    );
  }

  @override
  void dispose() {
    _socket.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: MyGradientAppBar(height: 90, title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ChatIcon(chat: chat),
            Expanded(
              child: MyTitleText(text: GetCHatName(chat),size: 18)
            ),
          ],
        ),),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              padding: const EdgeInsets.all(16),
              child: Obx(
                () => ListView(
                  // controller: _scrollController,
                  children: [
                    ...myChatController.Messages.map((e) => Container(
                          child: ChatMessage(
                            message: e,
                          ),
                        )),
                        const SizedBox(height: 100,)
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(child: MyInlineFillInput(controller: messageController,keyWoardType: TextInputType.text,inputFormatters: 'text',)),
                  const SizedBox(width: 3,),
                  IconButton(
                      splashColor: Colors.red,
                      highlightColor: const Color.fromARGB(34, 54, 146, 244),
                      splashRadius: 80,
                      onPressed: ()=>{
                        setMessage(),
                        chatUtills.getChatById(chat.chat.id),
                        messageController.text=''
                      },
                      icon: SvgPicture.asset('assets/img/chat_arrow.svg'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



