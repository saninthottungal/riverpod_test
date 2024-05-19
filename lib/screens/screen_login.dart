import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Authentication"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(
                'assets/login.json',
                height: 300,
                width: double.infinity,
              ),
              const SizedBox(height: 50),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  focusedBorder: OutlineInputBorder(),
                ),
                onSubmitted: (value) {},
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  focusedBorder: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.security_outlined),
                ),
                obscureText: true,
                onSubmitted: (value) {},
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
