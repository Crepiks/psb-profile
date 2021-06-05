import 'package:flutter/material.dart';
import "package:micro_mobile/micro_mobile.dart";
import "./models/transaction_model.dart";
import "./widgets/transaction_card.dart";

class ProfileScreen extends StatefulWidget {
  final Store store;

  ProfileScreen({required this.store});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final transactions = <Transaction>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                      image: Image.network(
                              'https://sun2.beeline-kz.userapi.com/s/v1/ig1/EyeumO0umDMi186TFU6iyd4XmAkXdJR1i0tteKtWSDPB3VrysjQ20qLmzDobDExc2eaqgpc4.jpg?size=400x0&quality=96&crop=1220,360,624,721&ava=1')
                          .image,
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
                child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      var transaction = transactions[index];

                      return Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: TransactionCard(
                            name: transaction.name,
                            date: transaction.date,
                            value: transaction.value),
                      );
                    })),
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
                  addTransation(transactions.length);
                }),
          ),
        ],
      ),
    )));
  }

  void addTransation(int id) {
    var transaction = Transaction(
        name: "Транзакция #" + id.toString(),
        date: "06.05.2021",
        value: "+250 USA");

    widget.store.emit('TRANSACTION_ADD', transaction);

    setState(() {
      transactions.add(transaction);
    });
  }
}
