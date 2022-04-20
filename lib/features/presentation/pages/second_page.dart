import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application_2/features/data/models/weather_model.dart';
import 'package:weather_application_2/features/data/models/weather_model.dart';
import 'package:weather_application_2/features/data/repository/weather_repository.dart';
import 'package:weather_application_2/features/domain/repositories/weather_repository.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_event.dart';
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
    // var forecastList = snapshot.data.list;
    // var icon = forecastList[0].getIconUrl();
    // var temp = forecastList[0].temp.day.toStringAsFixed(0);
    // var city = snapshot.data?.city.name;
    /* достал ситинейм с 1 пейдж */

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
      body: BlocProvider(
        // добавляю евент со значением
        create: (context) => WeatherBloc(weatherRepo)..add(WeatherLoadEvent(cityName: cityName.toString())), /*  */
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoadedState) {
              return Column( /* температура, влажность, скорость ветра */
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Text(
                    state.weatherModel.city!.name.toString() ,
                    style:  const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    state.weatherModel.city!.sunrise.toString() ,
                    style:  const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // const SizedBox(width: 20),const SizedBox(width: 20)
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
                    const Text(
                     '25',
                     style: TextStyle(
                      // fontWeight: FontWeight.bold,
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
                    const SizedBox(width: 20),
                    const Text(
                     '25',
                     style:  TextStyle(
                      // fontWeight: FontWeight.bold,
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
                        "assets/images/light_speed.png",
                        height: 80,
                        width: 80,
                        ),
                    const SizedBox(width: 20),
                    const Text(
                     '25',
                     style:  TextStyle(
                      // fontWeight: FontWeight.bold,
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
                child: Text('error')
              );
            } return const CircularProgressIndicator();
          }
        ),
      )
    );
    
  }
}
