import 'package:fire_app/screens/screen_home.dart';
import 'package:fire_app/screens/screen_login.dart';
import 'package:fire_app/state/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: authUser.when(
        data: (value) => value == null ? ScreenLogin() : const ScreenHome(),
        error: (err, stack) => ScreenLogin(),
        loading: () => ScreenLogin(),
      ),
    );
  }
}
