import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_application_2/features/data/repository/weather_repository.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_state.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  WeatherRepo weatherRepo = WeatherRepo();

  @override
  Widget build(BuildContext context) {
    Object? cityName = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, '/home'),
        ),
        actions: <Widget>[
          IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => Navigator.pushNamed(context, '/third'),
          ),
        ],
      ),
      body: BlocListener<WeatherBloc, WeatherState>(
        listener: ((context, state) {
           if (state is WeatherErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar( //снакбар по доке феликса через блокЛисенер. В билдер блока его нельзя выводить, да и он там кидает ошибку.
                content: Text('Ошибка получения данных'),
              ),
            );
          }
        }),
      child: BlocBuilder<WeatherBloc, WeatherState>(
          // bloc: GetIt.instance<WeatherBloc>(),
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoadedState) {
              return Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Text(
                    state.weatherModel.city?.name.toString() ?? '',
                    style:  const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.black87,
                    ),
                  ),
                  // Text(
                  //   state.weatherModel.list?[0].dtTxt.toString() ?? '',
                  //   style:  const TextStyle(
                  //     fontSize: 20,
                  //     color: Colors.black87,
                  //   ),
                  // ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/temp.png',
                        height: 80,
                        width: 80,
                        ),
                    const SizedBox(width: 20),
                    Text(
                      state.weatherModel.list?[0].main?.temp.toString() ?? '', //конкатинация не срабатывает, требует бэнг оператор. Но тогда без обработки могут быть ошибки с null
                      style: const TextStyle(
                        fontSize: 45,
                        color: Colors.black87,
                      ),
                     ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/humidity.png",
                        height: 80,
                        width: 80,
                        ),
                    const SizedBox(width: 40),
                    Text(
                     state.weatherModel.list?[0].main?.humidity.toString() ?? '',
                     style: const TextStyle(
                      fontSize: 45,
                      color: Colors.black87,
                    ),
                     ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/light_speed.png",
                        height: 80,
                        width: 80,
                        ),
                    const SizedBox(width: 20),
                    Text(
                     state.weatherModel.list?[0].wind?.speed.toString() ?? '',
                     style: const TextStyle(
                      fontSize: 45,
                      color: Colors.black87,
                    ),
                     ),
                    ],
                  ),
                ],
              );
            } else if (state is WeatherErrorState) {
              return const Center(
                child: Text('Ошибка получения данных')
              );
            } return const CircularProgressIndicator();
          }
        ),
      ));
  }
}

  // if (state is WeatherErrorState) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(state.error!),
  //     ),
  //   );