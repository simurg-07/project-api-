
import 'package:flutter/material.dart';
import 'package:projectcase/constants/constant.dart';
import 'package:projectcase/pages/sharePage.dart';
import 'package:projectcase/widget/post.dart';
import 'package:get/get.dart';
import '../data/service.dart';
import '../model/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post>? posts;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        title: const Center(
            child: Text(
          "Sosyal Duvar",
          style: CustomTextStyle.text3Style,
        )),
        actions: [
          IconButton(onPressed: () {Get.to(const mySharePage());}, icon: const Icon(Icons.post_add)),
        ],
      ),
      body: Visibility(
        visible: isLoaded,
        child: postWidget(),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
