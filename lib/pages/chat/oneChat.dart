import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyChatController.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/chatUtills.dart';
import 'dart:async';

class OneChat extends StatefulWidget {
  const OneChat({super.key});

  @override
  State<OneChat> createState() => _OneChatState();
}

class _OneChatState extends State<OneChat> {
  Timer? _timer;
  MyUserController myUserController = Get.put(MyUserController());
  MyChatController myChatController = Get.put(MyChatController());
  final TextEditingController messageController = TextEditingController();
  final Map<String, dynamic> argument = Get.arguments;
  late Map apponent;

  @override
  void initState() {
    _startPeriodicRequest();
    super.initState();
  }

  void _startPeriodicRequest() {
    // Сначала выполните запрос, чтобы не ждать первую секунду
    GetChatMessages(id: argument['id']);

    // Запускаем таймер, который будет повторять запрос каждую секунду
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      GetChatMessages(id: argument['id']);
    });
  }

  void setMessage() {
    SetMessageOnChatId(
        chatId: argument['id'], formData: {"message": messageController.text});
    GetChatMessages(id: argument['id']);
    messageController.text = '';
  }

    @override
  void dispose() {
    // Отменяем таймер, когда виджет уничтожается
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final vw = MediaQuery.of(context).size.width / 100;
    if (argument['user1Id'] == myUserController.user['id']) {
      setState(() {
        apponent = myUserController.Users.firstWhere(
            (element) => element['id'] == argument['user2Id']);
      });
    } else {
      setState(() {
        apponent = myUserController.Users.firstWhere(
            (element) => element['id'] == argument['user1Id']);
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Get.back();
            myChatController.clearOneChat();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/img/chats_edit.svg',
                width: 16,
              ),
            ),
          ),
        ],
        toolbarHeight: 90,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: apponent['img'] != ''
                    ? Container(
                        width: 30,
                        height: 30,
                        child: Image.network(
                          '${dotenv.env['STATIC_URL']}/${apponent['img']}',
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(17, 255, 255, 255)),
                        child: Center(
                          child: Text(
                            getFirstCharacter(apponent['name']),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 50 * vw,
              child: Text(
                apponent['name'] != '' ? apponent['name'] : 'Не заполнено',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent, // Устанавливаем прозрачный фон
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xff4D8AEE),
                Color(0xff2932FF)
              ], // Цвета радиального градиента
              center: Alignment.topLeft, // Центр радиального градиента
              radius: 3.5, // Радиус радиального градиента
            ),
          ),
        ), // Устанавливаем прозрачный фон
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              padding: EdgeInsets.all(16),
              child: Obx(
                () => ListView(
                  children: [
                    ...myChatController.Messages.map((e) => Container(
                          child: _MessageCard(
                            messageCard: e,
                            vw: vw,
                          ),
                        )),
                        SizedBox(height: 100,)
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      cursorColor: const Color.fromARGB(255, 112, 112, 112),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                        hintText: 'Сообщение...',
                        filled: true, // Set to true to fill the background
                        fillColor:
                            const Color(0xff23252B), // Set background color
                        hintStyle: const TextStyle(
                            color: Colors.grey), // Customize hint text color
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none, // Remove border
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none, // Remove border
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  IconButton(
                      splashColor: Colors.red,
                      highlightColor: Color.fromARGB(34, 54, 146, 244),
                      splashRadius: 80,
                      onPressed: setMessage,
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

String getFirstCharacter(String input) {
  if (input.isNotEmpty) {
    return input[0];
  } else {
    return '?'; // Возвращает пустую строку, если входная строка пуста или null
  }
}

class _MessageCard extends StatelessWidget {
  _MessageCard({super.key, required this.messageCard, required this.vw});
  Map messageCard;
  double vw;
  MyUserController myUserController = Get.put(MyUserController());

  @override
  Widget build(BuildContext context) {
    if (messageCard['userId'] == myUserController.user['id']) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const RadialGradient(
                colors: [
                  Color(0xff4D8AEE),
                  Color.fromARGB(201, 41, 52, 255),
                ],
                radius: 2.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 80*vw, // Укажите желаемую максимальную ширину
              ),
              child: Text(
                messageCard['message'],
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Color(0xff23252B),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              messageCard['message'],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    }
  }
}
