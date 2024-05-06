String? isEmail(String email) {
  if (email.isEmpty) return 'Пожалуйста введите свой Email';
  String p =
      "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
  RegExp regExp = new RegExp(p);

  if (regExp.hasMatch(email)) return 'ok';

  return 'Это не E-mail';
}
