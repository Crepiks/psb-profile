import 'package:flutter/material.dart';
import "package:micro_mobile/micro_mobile.dart";
import "./widgets/transaction_card.dart";

class ProfileScreen extends StatefulWidget {
  late final Store store;

  ProfileScreen({store}) {
    this.store = store;
  }

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  "Профиль",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: Image.asset('assets/images/avatar.jpg').image,
                      fit: BoxFit.fill),
                ),
              ),
              Text("Саяжан Онласын",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              Text("Москва, Россия", style: TextStyle(fontSize: 16))
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: TransactionCard(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: TransactionCard(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: TransactionCard(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: TransactionCard(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    )),
                    elevation: MaterialStateProperty.all<double>(0)),
                child: Text(
                  "Добавить платеж",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  widget.store.emit('onClick', "Hello");
                  print("Button is pressed");
                }),
          ),
        ],
      ),
    ));
  }
}
