import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final cityController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => GetIt.instance<WeatherBloc>(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: AppColor.primaryColor,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: AppColor.primaryColor,
                      )
                    ),
                    labelText: 'Название города',
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.location_city, 
                      color: AppColor.primaryColor
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {/* прокидываю параметры на 2 экран */
                GetIt.instance<WeatherBloc>().add(WeatherLoadEvent(cityName: cityController.text));
                Navigator.pushNamed(context, '/second', arguments: cityController.text);
              },
              child: const Text(
                'Подтвердить',
                style: TextStyle(
                  fontSize: 15
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              )
            )
          ],
        ),
      )
    );
  }
}