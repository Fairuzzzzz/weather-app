import 'package:flutter/material.dart';

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
        title: Text(
          '7 Days',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 46),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                        Row(
                          children: [
                            Text(
                              '20',
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
                              '21',
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
            height: 12,
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
                      style: TextStyle(fontSize: 14, color: Colors.white70),
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
                      style: TextStyle(fontSize: 14, color: Colors.white70),
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
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 34,
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mon',
                            style:
                                TextStyle(color: Colors.white60, fontSize: 18),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/Snow.png',
                                scale: 5,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text('Snow',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))
                            ],
                          ),
                          Row(
                            children: [
                              Text('+20',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                '+14',
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
      )),
      backgroundColor: Colors.black,
    );
  }
}
