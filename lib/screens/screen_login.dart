import 'package:fire_app/state/login/login.dart';
import 'package:fire_app/state/login/password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class ScreenLogin extends ConsumerWidget {
  ScreenLogin({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = ref.watch(passWordProvider);

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
              //email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              //password
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  focusedBorder: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      ref.read(passWordProvider.notifier).changeState();
                    },
                    icon: Icon(isPasswordVisible
                        ? Icons.security
                        : Icons.remove_red_eye_outlined),
                  ),
                ),
                obscureText: !isPasswordVisible,
              ),
              const SizedBox(height: 30),
              //login button
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;
                  await ref.read(authProvider.notifier).signIn(email, password);
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              //sign Up button
              CupertinoButton(
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;
                  await ref.read(authProvider.notifier).signUp(email, password);
                },
                child: const Text('SignUp'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
