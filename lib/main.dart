import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application_2/features/data/repository/weather_repository.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_bloc_observer.dart';
import 'package:weather_application_2/features/presentation/pages/home_page.dart';
import 'package:weather_application_2/features/presentation/pages/second_page.dart';
import 'package:weather_application_2/features/presentation/pages/third_page.dart';

void main() async { 
  BlocOverrides.runZoned( 
    () => runApp(const MyApp()),
    blocObserver: BlocsObserver(), //блокОбсервер инициализируется в мейне. Использую для отлова ошибок и показа текущего стейта
  ); 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider( // регистрирую репозиторий
      create: (context) => WeatherRepo(),
        child: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(context.read<WeatherRepo>()), 
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
              ),
              debugShowCheckedModeBanner: false, //снимаю Debug mode в правом верхнем углу экрана
              home: const HomePage(),
              
              initialRoute: '/home', //именованные роуты для навигации между экранами
              routes: {
                '/home': (context) => const HomePage(),
                '/second': (context) => const SecondPage(),
                '/third': (context) => const ThirdPage(),
              },
            )
        ),
    );
  }
}

