// import 'package:flutter/material.dart';

// class ThirdDay extends StatefulWidget {
//   const ThirdDay({Key? key}) : super(key: key);

//   @override
//   State<ThirdDay> createState() => _ThirdDayState();
// }

// class _ThirdDayState extends State<ThirdDay> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ThirdPage'),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pushNamed(context, '/home'),
//         ),
//       ),
//       body: /* BlocBuilder<WeatherBloc, WeatherState>(
//         bloc: GetIt.instance<WeatherBloc>(),
//         builder: (context, state) {
//           if (state is WeatherLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is WeatherLoadedState) { */
//             /* return */ Column(

//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget> [
//                   Text(
//                     state.weatherModel.city?.name.toString() ?? '',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 50,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     state.weatherModel.list?[0].dtTxt.toString() ?? '',
//                     style: const TextStyle(
//                       fontSize: 20,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/images/temp.png',
//                         height: 70,
//                         width: 70,
//                         ),
//                     const SizedBox(width: 20),
//                     Text(
//                       state.weatherModel.list?[0].main?.temp.toString() ?? '', //конкатинация не срабатывает, требует бэнг оператор. Но тогда без обработки могут быть ошибки с null
//                       style: const TextStyle(
//                         fontSize: 35,
//                         color: Colors.black87,
//                       ),
//                      ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         "assets/images/humidity.png",
//                         height: 70,
//                         width: 70,
//                         ),
//                     const SizedBox(width: 40),
//                     Text(
//                      state.weatherModel.list?[0].main?.humidity.toString() ?? '',
//                      style: const TextStyle(
//                       fontSize: 35,
//                       color: Colors.black87,
//                     ),
//                      ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         "assets/images/light_speed.png",
//                         height: 70,
//                         width: 70,
//                         ),
//                     const SizedBox(width: 20),
//                     Text(
//                      state.weatherModel.list?[0].wind?.speed.toString() ?? '',
//                      style: const TextStyle(
//                       fontSize: 35,
//                       color: Colors.black87,
//                     ),
//                      ),
//                     ],
//                   ),
//                 ],
//               ),