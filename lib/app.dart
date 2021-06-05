import 'package:flutter/material.dart';
import "package:micro_mobile/micro_mobile.dart";

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            child: Text(
              "Профиль",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: SizedBox(
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
          )
        ],
      ),
    );
  }
}
