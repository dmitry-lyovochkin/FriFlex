import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_event.dart';
import 'package:weather_application_2/features/presentation/theme/colors/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cityController = TextEditingController(); // контроллер для вводимого города

  @override
  void dispose() {
    cityController.dispose();
    super.dispose(); // закрываю контроллер
  }
 
  @override
  Widget build(BuildContext context) {
    return /* BlocProvider<WeatherBloc>(
      create: (context) => GetIt.instance<WeatherBloc>(), */
      /* child: */ Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: cityController, // даю контроллер ТекстФилду
                  decoration: InputDecoration(
                    border: OutlineInputBorder( // задаю внешние параметры бордеру без фокуса
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: AppColor.primaryColor,
                      )
                    ),
                    focusedBorder: OutlineInputBorder( // задаю внешние параметры бордеру с фокусом
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: AppColor.primaryColor,
                      )
                    ),
                    labelText: 'Название города',
                    filled: true,
                    prefixIcon: const Icon( // показываю иконку вначале вводимого поля
                      Icons.location_city, 
                      color: AppColor.primaryColor
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {/* прокидываю параметры на 2 экран */
                GetIt.instance<WeatherBloc>().add(WeatherLoadEvent(cityName: cityController.text));
                Navigator.pushNamed(context, '/second');
              },
              child: const Text(
                'Подтвердить',
                style: TextStyle(
                  fontSize: 15
                ),
              ),
              style: ElevatedButton.styleFrom( // задаю стиль кнопки
                primary: AppColor.primaryColor,
                shape: RoundedRectangleBorder( // скругление бордера кнопки
                  borderRadius: BorderRadius.circular(10)
                )
              )
            )
          ],
        ),
      );
  }
}