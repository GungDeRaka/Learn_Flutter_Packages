// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_learn/user.dart';
import 'package:flutter_carousel_learn/user_cards.dart';
import 'package:flutter_carousel_learn/user_service.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  List<User> users = [];
  bool isLoading = true;
  int myIndex = 0;
  CarouselController carouselController = CarouselController();

  void getUsers() async {
    var result = await UserService.fetchData();
    setState(() {
      users = result;
    });
    isLoading = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 400,
                      child: CarouselSlider.builder(
                          carouselController: carouselController,
                          itemCount: users.length,
                          itemBuilder: (context, index, realIndex) {
                            var user = users[index];
                            return UserCard(
                                avatar: user.avatar!,
                                userName:
                                    '${user.firstName!} ${user.lastName!}',
                                userEmail: user.email!);
                          },
                          options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                myIndex = index;
                                setState(() {});
                              },
                              autoPlay: true,
                              height: 600,
                              enableInfiniteScroll: false)),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: users.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        myIndex == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ));
  }
}
