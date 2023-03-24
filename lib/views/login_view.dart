import 'package:flutter/material.dart';
import 'package:ew_app/controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView(LoginController loginController, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _loginController = LoginController();

  @override
  void initState() {
    super.initState();
    _loginController.emailController = TextEditingController();
    _loginController.passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController.emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                errorText: _loginController.getShowLoginError
                    ? _loginController.getLoginErrorText
                    : null,
              ),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _loginController.passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                errorText: _loginController.getShowPasswordError
                    ? _loginController.getPasswordErrorText
                    : null,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _loginController.validateInputs();
                  _loginController.login(context);
                });
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
