import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectcase/widget/profile.dart';
import 'package:projectcase/widget/share.dart';
import '../constants/constant.dart';
import 'homePage.dart';

// ignore: camel_case_types
class mySharePage extends StatefulWidget {
  const mySharePage({Key? key}) : super(key: key);

  @override
  State<mySharePage> createState() => _mySharePageState();
}

// ignore: camel_case_types
class _mySharePageState extends State<mySharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(onPressed: () { Get.to(const MyHomePage());}, icon: const Icon(Icons.home)),
        title: const Center(
            child: Text(
              "Gönderi Duvarı",
              style: CustomTextStyle.text3Style,
            )),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.post_add)),
        ],
      ),
      body: Column(
        children: const [
          SizedBox(
            height:5,
          ),
          profileWidget(),
          SizedBox(
            height:5,
          ),
          shareWidget(),
        ],
      ),
    );
  }
}
