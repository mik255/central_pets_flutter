class CredentialsEntity {
   String email;
   String password;

  CredentialsEntity({
    required this.email,
    required this.password,
  });
  String? isValidEmail() {
    if (email.isEmpty) {
      throw 'Email não pode ser vazio!';
    }
    var regex = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
    if (!regex.hasMatch(email)) {
      throw 'Email não é valido!';
    }
    return null;
  }

  String? isValidPassword() {
    if (password.isEmpty) {
      throw 'Senha não pode ser vazio!';
    }
    var regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (!regex.hasMatch(password)) {
      throw 'Senha não é valido!';
    }
    return null;
  }
}
