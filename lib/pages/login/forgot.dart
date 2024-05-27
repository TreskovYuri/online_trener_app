import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

final form_key = GlobalKey<FormState>();

class Forgot extends StatefulWidget {
  const Forgot({Key? key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final TextEditingController emailController = TextEditingController();
  var checked = true;
    String email = '';
    var emailError = false;
    String emailErrorText = '';

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
  setState(() {
    email = emailC;

  });
}




  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context)
            .size
            .height, // Установите высоту контейнера равной высоте экрана
        decoration: BoxDecoration(color: Color(0xff1B1C20)),
        child: SingleChildScrollView(
          physics:
              AlwaysScrollableScrollPhysics(), // Установите физику прокрутки AlwaysScrollableScrollPhysics()
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Expanded(child: Image.asset('assets/img/login_img.png'))
              ]),
              SizedBox(
                height: 3 * vh,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4 * vw, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Восстановление пароля!",
                        style: TextStyle(
                            color: const Color.fromARGB(234, 255, 255, 255),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            fontSize: 7 * vw),
                      ),
                    ),
                    SizedBox(
                      height: 5 * vh,
                    ),
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
                      height: 1 * vh,
                    ),
                    TextField(
                      controller: emailController,
                      onChanged: (value) => setState(() {
                          email= value;
                      }),
                      cursorColor: Color.fromARGB(255, 112, 112, 112),
                      style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                      decoration: InputDecoration(
                        hintText: '',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 4 * vw,vertical: 2*vh),
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
                    
                    SizedBox(
                      height: 4 * vw,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/login', // Переход на login
                            );
                          },
                          child: Text(
                            "У меня уже есть пароль",
                            style: TextStyle(
                                color: Color.fromARGB(130, 255, 255, 255),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 4 * vw),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15 * vw,
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
                          borderRadius: BorderRadius.circular(
                              10 * vw), // Округление углов по вашему усмотрению
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
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
                            "Отправить",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.none,
                                fontSize: 4.5 * vw),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2*vw,)
            ],
          ),
        ),
      ),
    );
  }
}
