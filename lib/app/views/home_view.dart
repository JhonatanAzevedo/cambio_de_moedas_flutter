import 'package:conversor_moedas_curso/app/components/currency_box.dart';
import 'package:conversor_moedas_curso/app/controllers/home_controller.dart';
import 'package:conversor_moedas_curso/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
 
  @override
  _HomeViewState createState() => _HomeViewState();
}



class _HomeViewState extends State<HomeView> {
  
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  
  
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
            ),
            CurrencyBox(
              selectedItem: homeController.toCurrency,
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model;
                });
              },
              controller: toText,
              items: homeController.currencies,
            ),
            SizedBox(height: 20),
            CurrencyBox(
              selectedItem: homeController.fromCurrency,
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model;
                });
              },
              controller: fromText,
              items: homeController.currencies,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                homeController.convert();
              },
              child: Text('CONVERTER'),
            )
          ],
        ),
      ),
    ));
  }
}

/* void setState(Null Function() param0) {
} */




