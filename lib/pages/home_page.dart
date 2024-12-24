import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/bloc/weather_bloc_bloc.dart';
import 'package:weatherapp/pages/7days_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
          builder: (context, state) {
            if (state is WeatherBlocSuccess) {
              return Text(
                '${state.weather.areaName}',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              );
            } else {
              return Container();
            }
          },
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlue, Colors.blueAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
            builder: (context, state) {
              if (state is WeatherBlocSuccess) {
                return Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Image.asset('assets/images/Sunny.png'),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        '${state.weather.temperature!.celsius!.round()}°',
                        style: TextStyle(
                            fontSize: 120, color: Colors.white, height: 0.9),
                      ),
                      Text(
                        state.weather.weatherMain!,
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      Text(
                        DateFormat('EEEE, dd MMM - HH:mm')
                            .format(state.weather.date!),
                        //'Monday, 17 May',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      SizedBox(
                        height: 34,
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
                                  '${state.weather.windSpeed!.round()} m/s',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white70),
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
                                  '${state.weather.humidity!.round()} %',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Humidity',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white70),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/MaxTemp.svg',
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '${state.weather.tempMax!.celsius!.round()}°',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Max Temp',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white70),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 28, horizontal: 26),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DaysPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Text(
                                  '7 Days',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/ChevronRight.svg',
                                  color: Colors.white70,
                                  height: 16,
                                  width: 16,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 140,
                      child: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                        builder: (context, state) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 80,
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Column(
                                    children: [
                                      Text(
                                        '21',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset(
                                        'assets/images/Thunderstorm.png',
                                        scale: 6,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '10.00',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
