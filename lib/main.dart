import 'package:elearningapp_frontend/init/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elearningapp_frontend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:elearningapp_frontend/features/auth/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies(); // Initialise GetIt
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<AuthBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eLearning App',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const LoginPage(),
      ),
    );
  }
}
