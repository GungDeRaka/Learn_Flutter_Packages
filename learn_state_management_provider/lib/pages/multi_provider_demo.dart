import 'package:flutter/material.dart';
import 'package:learn_state_management_provider/models/cart.dart';
import 'package:learn_state_management_provider/models/money.dart';
import 'package:provider/provider.dart';

class MultiProviderDemo extends StatelessWidget {
  const MultiProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Money>(
          create: (context) => Money(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Balance",
                      style:const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  
                  Container(
                    height: 50,
                    width: 150,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                        color: Colors.purple[200]),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:Consumer<Money>(
                    builder: (context, money, child) =>  Text(
                      money.balance.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 28),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3.0,
                    color: Colors.grey[900]!,
                  ),
                ),
                child: Consumer<Cart>(
                  builder:(context, cart, child) => ListTile(
                    leading: Text(
                      "Apple : 500 x ${cart.cart}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      (500*cart.cart).toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Consumer<Money>(
          builder: (context, money, child) => Consumer<Cart>(
          builder: (context, cart, child) => FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              if(money.balance >= 500){
                cart.cart++;
                money.balance -= 500;
              }
            },
          ),
        ),),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
      ),
    );
  }
}
