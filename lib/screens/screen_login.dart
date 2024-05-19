import 'package:fire_app/state/login/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class ScreenLogin extends ConsumerWidget {
  const ScreenLogin({super.key});

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
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  focusedBorder: OutlineInputBorder(),
                ),
                onSubmitted: (value) {},
              ),
              const SizedBox(height: 30),
              //password
              TextField(
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
