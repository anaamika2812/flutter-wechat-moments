import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wechatmoments_flutter_mobile/presentation/bloc/moment_bloc.dart';
import 'package:wechatmoments_flutter_mobile/presentation/screens/moments_screen.dart';

import 'core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => sl<MomentBloc>(),
        child: MomentsScreen(),
      ),
    );
  }
}
