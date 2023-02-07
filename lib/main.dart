import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app_bloc/presentation/resources/router_management.dart';
import 'package:todo_app_bloc/presentation/resources/theme.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/home_page_screen.dart';
import 'presentation/bloc/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            onGenerateRoute: RoutManager.getRoute,
          );
        },
      ),
    );
  }
}
