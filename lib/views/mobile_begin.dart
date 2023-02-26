import 'package:flutter/material.dart';

class MobileBegin extends StatelessWidget {
  const MobileBegin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            children: [
              Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      "img/verde2.jpeg"
                    ),
                    fit: BoxFit.cover
                  )
                ),
                child: Center(child: Text("hola")),
              ),

            ],
          )
        ],
    );
  }
}