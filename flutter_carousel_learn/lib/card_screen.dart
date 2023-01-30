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

  void getUsers()async{
    var result  = await UserService.fetchData();
    setState(() {
      users=result;
    });
    isLoading=false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: isLoading ? Center(child: CircularProgressIndicator(),):Center(
          child: CarouselSlider.builder(
              itemCount: users.length,
              
              itemBuilder: (context, index, realIndex) { 
                var user = users[index];
                return UserCard(
                  avatar: user.avatar!, userName: '${user.firstName!} ${user.lastName!}', userEmail: user.email!);},
              options: CarouselOptions(autoPlay: true)),
        ));
  }
}
