import 'package:flutter/material.dart';

import '../constants/constant.dart';

class profileWidget extends StatelessWidget {
  const profileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.3),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(

            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.miyhav.com/icerik/uploads/2019/03/yavru-ordek-cinsiyet-ayrimi.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Faruk Topal",
                    style: CustomTextStyle.text2Style,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(

                        children: const [
                          Icon(Icons.accessibility_sharp),
                          Text("Gönderi 25")
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.accessibility_sharp),
                          Text("Yorum 10")
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
