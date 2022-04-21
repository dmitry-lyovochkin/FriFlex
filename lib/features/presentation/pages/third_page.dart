import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_application_2/features/presentation/bloc/weather_state.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('ThirdPage'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, '/home'),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        bloc: GetIt.instance<WeatherBloc>(),
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoadedState) {
            return Column(
              children: [
                Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Text(
                    state.weatherModel.city?.name.toString() ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    state.weatherModel.list?[0].dtTxt.toString() ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/temp.png',
                        height: 70,
                        width: 70,
                        ),
                    const SizedBox(width: 20),
                    Text(
                      state.weatherModel.list?[0].main?.temp.toString() ?? '', //конкатинация не срабатывает, требует бэнг оператор. Но тогда без обработки могут быть ошибки с null
                      style: const TextStyle(
                        fontSize: 35,
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
                        height: 70,
                        width: 70,
                        ),
                    const SizedBox(width: 40),
                    Text(
                     state.weatherModel.list?[0].main?.humidity.toString() ?? '',
                     style: const TextStyle(
                      fontSize: 35,
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
                        height: 70,
                        width: 70,
                        ),
                    const SizedBox(width: 20),
                    Text(
                     state.weatherModel.list?[0].wind?.speed.toString() ?? '',
                     style: const TextStyle(
                      fontSize: 35,
                      color: Colors.black87,
                    ),
                     ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
              const Text(
                'Погода на три дня',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height / 4.8,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                separatorBuilder: ((context, index) => const SizedBox(width: 15)),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state.weatherModel.list!.length,
                itemBuilder: (BuildContext context, int index) { 
                   
                return Container( 
                  width: MediaQuery.of(context).size.width / 1.7,
                  color: Colors.amber[300],
                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text(
                        state.weatherModel.city?.name.toString() ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        state.weatherModel.list?[index].dtTxt.toString() ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/temp.png',
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            state.weatherModel.list?[index].main?.temp.toString() ?? '', //конкатинация не срабатывает, требует бэнг оператор. Но тогда без обработки могут быть ошибки с null
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "assets/images/humidity.png",
                            height: 30,
                            width: 30,
                            ),
                            // const SizedBox(width: 15),
                            Text(
                          state.weatherModel.list?[index].main?.humidity.toString() ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "assets/images/light_speed.png",
                            height: 30,
                            width: 30,
                            ),
                            Text(
                          state.weatherModel.list?[index].wind?.speed.toString() ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                            ),
                        ],
                      ),
                    ]
                    )
                );
                }
              ),
            )
            ]
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
