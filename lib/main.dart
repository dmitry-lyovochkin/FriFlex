import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application_2/features/domain/repositories/weather_repository.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_bloc_observer.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_event.dart';
import 'package:weather_application_2/features/presentation/pages/home_page.dart';
import 'package:weather_application_2/features/presentation/pages/second_page.dart';
import 'package:weather_application_2/features/presentation/pages/third_page.dart';
import 'package:weather_application_2/locator_service.dart' as depinjections;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await depinjections.initializeDependencies();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: WeatherBlocObserver(),
  ); 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        initialRoute: '/',
        routes: {
        '/home': (context) => const HomePage(),
        '/second': (context) => const SecondPage(),
        '/third': (context) => const ThirdPage(),
        },
      );
    
  }
}

