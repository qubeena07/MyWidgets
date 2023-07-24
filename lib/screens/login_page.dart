import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _opacity,
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            const SizedBox(height: 20.0),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 10.0),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Don\'t have an account? Register here.'),
            ),
          ],
        ),
      ),
    );
  }
}
