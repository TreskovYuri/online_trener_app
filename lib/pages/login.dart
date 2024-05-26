import 'package:flutter/material.dart';
import 'package:trener_app/http/exerciseUtills.dart';
// import 'package:new_flutter/http/userUtills.dart';

import 'package:trener_app/http/index.dart';
import 'package:trener_app/http/userUtills.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/utills/validator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


void getData() async {
  var data = await MyCasomGetHttpReauest(urls: 'user');
  // print(data);
}

final form_key = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var checked = true;
  var emailError = false;
  String emailErrorText = '';
  var passwordError = false;
  String passwordErrorText = '';
  String email = '';
  String password = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

// Процесс инициализации
  @override
  void initState() {
    super.initState();
    loadData();
  }

// Функция для получения данных из кеша
void loadData() async {

  final box = GetStorage();
  String emailC = await box.read('email') ?? ''; 
  emailController.text = emailC;
  String passwordC = await box.read('password') ?? ''; 
  passwordController.text = passwordC;
  setState(() {
    email = emailC;
    password = passwordC;
  });
}

  void cacheEmailPassword() async {
    try {
      final box = GetStorage();
    if (checked) {
      await box.write('email', email);
      await box.write('password', password);
    } else {
      await box.remove('email');
      await box.remove('password');
    }
    } catch (e) {
      print(e);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    DateTime now = DateTime.now();
    final mobx = Provider.of<Mobx>(context);

    String formattedDate = DateFormat('dd.MM.yyyy').format(now);
    mobx.setCurrentDate(formattedDate);

    void login() async {
      var emailValidate = isEmail(email);
      if (emailValidate == 'ok' && password.length > 1) {
        setState(() {
          passwordError = false;
          emailError = false;
        });

        var data = await SignIn(email: email.replaceAll(' ', ''), password: password.replaceAll(' ', ''), mobx: mobx);
        // print(data);
        if (data != null) {
          switch (data['status']) {
            case 200:
              // print(data);
              if(data['body']['post'] == 'Тренер' || data['body']['post'] == 'Супер тренер'){
                Navigator.pushReplacementNamed(context,'/journal');
              }else{
                Navigator.pushReplacementNamed(context,'/planner');
              }
              cacheEmailPassword();
                
              break;
            case 400:
              if (data['body']['message'] != null) {
                // print(data['body']['message']);
                setState(() {
                  emailError = true;
                  emailErrorText = '${data['body']['message']}';
                });
              }
              break;
            case 404:
              if (data['body']['message'] != null) {
                // print(data['body']['message']);
                setState(() {
                  emailError = true;
                  emailErrorText = '${data['body']['message']}';
                });
              }

              break;
            default:
              setState(() {
                emailError = true;
                emailErrorText = 'Непредвиденная ошибка';
              });
              // print(data);
          }
        }else{
              setState(() {
                emailError = true;
                emailErrorText = 'сервер не отвечает...';
              });
        }
      }
      if (password.length < 5) {
        setState(() {
          passwordError = true;
          passwordErrorText = 'Не корректный пароль!';
        });
      } else {
        passwordError = false;
      }
      if (emailValidate != 'ok') {
        setState(() {
          emailError = true;
          emailErrorText = '$emailValidate';
        });
      }
      // var data = await SignIn(email: email, password: password);
    }

    return Hero(
      tag: '1qwq',
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context)
              .size
              .height, // Установите высоту контейнера равной высоте экрана
          decoration: const BoxDecoration(color: Color(0xff1B1C20)),
          child: SingleChildScrollView(
            physics:
                const AlwaysScrollableScrollPhysics(), // Установите физику прокрутки AlwaysScrollableScrollPhysics()
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Expanded(child: Image.asset('assets/img/login_img.png'))
                ]),
                SizedBox(
                  height: 5 * vw,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3 * vw, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Добро пожаловать!",
                          style: TextStyle(
                              color: const Color.fromARGB(234, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                              fontSize: 7 * vw),
                        ),
                      ),
                      SizedBox(
                        height: 10 * vw,
                      ),
                      emailError
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "$emailErrorText",
                                style: TextStyle(
                                    color: Color.fromARGB(130, 255, 0, 0),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                            )
                          : SizedBox(),
                      Text(
                        "Почта",
                        style: TextStyle(
                            color: Color.fromARGB(130, 255, 255, 255),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            fontSize: 3 * vw),
                      ),
                      SizedBox(
                        height: 1 * vw,
                      ),
                      TextField(
                        controller: emailController,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        cursorColor: Color.fromARGB(255, 112, 112, 112),
                        style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                        decoration: InputDecoration(
                          hintText: '',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 4 * vw, vertical: 1.5 * vh),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4 * vw),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4 * vw),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 112, 112, 112),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4 * vw,
                      ),
                      passwordError
                          ? Text(
                              "$passwordErrorText",
                              style: TextStyle(
                                  color: Color.fromARGB(130, 255, 0, 0),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                  fontSize: 4 * vw),
                            )
                          : SizedBox(),
                      Text(
                        "Пароль",
                        style: TextStyle(
                            color: Color.fromARGB(130, 255, 255, 255),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            fontSize: 3 * vw),
                      ),
                      SizedBox(
                        height: 1 * vw,
                      ),
                      TextField(
                        controller: passwordController,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        cursorColor: Color.fromARGB(255, 112, 112, 112),
                        style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                        decoration: InputDecoration(
                          hintText: '',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 4 * vw, vertical: 1.5 * vh),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4 * vw),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4 * vw),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 112, 112, 112),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4 * vw,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                checkColor: Colors.white,
                                activeColor: Colors.blue,
                                value: checked,
                                onChanged: (value) {
                                  setState(() {
                                    checked = value!;
                                  });
                                },
                              ),
                              Text(
                                "Запомнить меня",
                                style: TextStyle(
                                    color: Color.fromARGB(126, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 3.7 * vw),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                '/forgot', // Переход на login
                              );
                            },
                            child: Text(
                              "Забыли пароль?",
                              style: TextStyle(
                                  color: Color.fromARGB(130, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                  fontSize: 3.7 * vw),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6 * vw,
                      ),
                      Center(
                        child: Container(
                          width: 95 *
                              vw, // Установите ширину контейнера по вашему усмотрению
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff4D8AEE),
                                Color(0xff2932FF)
                              ], // Цвета вашего градиента
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10 *
                                vw), // Округление углов по вашему усмотрению
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.transparent, // Прозрачный фон кнопки
                              elevation: 0, // Убирает тень кнопки
                              padding: EdgeInsets.symmetric(vertical: 3 * vw),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Округление углов кнопки должно соответствовать контейнеру
                              ),
                            ),
                            child: Text(
                              "Войти",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.none,
                                  fontSize: 4 * vw),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3 * vw,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
