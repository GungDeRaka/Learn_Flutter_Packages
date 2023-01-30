// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CarouselController buttonCarouselController = CarouselController();
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: ListView(
        children: [
          SizedBox(
              height: 200,
              width: 100,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 20,
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  autoPlayInterval: Duration(milliseconds: 2000),
                  autoPlayCurve: Curves.elasticInOut,
                ),
                disableGesture: true,
                carouselController: carouselController,
                itemCount: 15,

                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  color: itemIndex % 2 == 0 ? Colors.blue : Colors.red,
                  child: Center(child: Text(itemIndex.toString())),
                ),
              )),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
              )
            ],
          ),
          // ElevatedButton(
          //   onPressed: () => carouselController.startAutoPlay(),
          //   child: Text('→'),

          const SizedBox(
            height: 24.0,
          ),
          CarouselSlider(
            items: [
              Container(
                height: 40,
                width: 40,
                color: Colors.black,
              ),
              Container(
                height: 40,
                width: 40,
                color: Colors.pink,
              ),
              Container(
                height: 40,
                width: 40,
                color: Colors.blue,
              ),
              Container(
                height: 40,
                width: 40,
                color: Colors.green,
              ),
              Container(
                height: 40,
                width: 40,
                color: Colors.red,
              ),
            ],
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          ElevatedButton(
            onPressed: () => buttonCarouselController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear),
            child: Text('→'),
          )
        ],
      ),
    );
  }
}
