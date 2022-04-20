import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application_2/features/data/repository/weather_repository.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_event.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_state.dart';
import 'package:weather_application_2/locator_service.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  
  @override
  Widget build(BuildContext context) {
    Object? cityName = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ThirdPage'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, '/home'),
        ),
      ),
      // body: BlocProvider(
      //   create: (context) => injection<WeatherBloc>(), 

        body: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: BlocProvider.of<WeatherBloc>(context),
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoadedState) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Column( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Text(
                          state.weatherModel.city?.name.toString() ?? '' ,
                          style:  const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          state.weatherModel.list?[0].dtTxt.toString() ?? ''  ,
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
                          Text(
                          state.weatherModel.list?[0].main?.temp.toString() ?? '',
                          style: const TextStyle(
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
                            // fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Colors.black87,
                          ),
                          ),
                          ],
                        ),
                      ],
                    )
                ],
              );
            } else if (state is WeatherErrorState) {
              return const Center(
                child: Text('error')
              );
            } return const CircularProgressIndicator();
          }
        ),
      );
    
    
  }
}
