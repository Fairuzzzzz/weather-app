import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/bloc/weather_bloc_bloc.dart';

class DaysPage extends StatefulWidget {
  const DaysPage({super.key});

  @override
  State<DaysPage> createState() => _DaysPageState();
}

class _DaysPageState extends State<DaysPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          '7 Days',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(child: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
        builder: (context, state) {
          if (state is WeatherBlocSuccess) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 46),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Cloud.png',
                            scale: 1.25,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tomorrow',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24)),
                              Row(
                                children: [
                                  Text(
                                    '${state.dailyForecast[0].tempMax!.celsius!.round()}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '/',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${state.dailyForecast[0].tempMin!.celsius!.round()}',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Text(
                                'Cloud',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Wind.svg',
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '13 km/h',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Wind',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Humidity.svg',
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '24 %',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Humidity',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/MaxTemp.svg',
                              color: Colors.white),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '83 %',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Max Temp',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 6),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          final Weather dayWeather = state.dailyForecast[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat('EEE').format(dayWeather.date!),
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/Snow.png',
                                      scale: 6,
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Text(dayWeather.weatherMain ?? 'Unknown',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        '${dayWeather.tempMax?.celsius?.round() ?? 0}°}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      '+${dayWeather.tempMin?.celsius?.round() ?? 0}°}',
                                      style: TextStyle(color: Colors.white60),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
      backgroundColor: Colors.black,
    );
  }
}
