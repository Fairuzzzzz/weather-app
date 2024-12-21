import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

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
        title: Text(
          'Yogyakarta',
          style: TextStyle(color: Colors.white),
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
          Positioned(
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
                  '21',
                  style: TextStyle(
                      fontSize: 120, color: Colors.white, height: 0.9),
                ),
                Text(
                  'Sunny',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                Text(
                  'Monday, 17 May',
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
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(color: Colors.white),
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
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(color: Colors.white),
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
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(color: Colors.white),
                          ),
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
                            'Chance of rain',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
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
                          onTap: () {},
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
                      child: ListView.builder(
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
                          }),
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
