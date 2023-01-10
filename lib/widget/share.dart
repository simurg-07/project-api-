

import 'package:flutter/material.dart';

class shareWidget extends StatelessWidget {
  const shareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.3),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText:
                  "Paylaşmak İstediğiniz Konu Hakkında Birşeyler Yazın...",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 35,
                      width: 175,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(35)),
                      child:
                      const Center(child: Text("Fotoğraf / Video Ekle")),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(35)),
                      child: const Center(child: Text("Palyaş")),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
