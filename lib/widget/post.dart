import 'package:flutter/material.dart';
import '../constants/constant.dart';
import '../data/service.dart';
import '../model/model.dart';

class postWidget extends StatefulWidget {
  postWidget({Key? key}) : super(key: key);

  @override
  State<postWidget> createState() => _postWidgetState();
}

class _postWidgetState extends State<postWidget> {
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
    final size = MediaQuery.of(context).size;
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: posts?.length ,
        itemBuilder: (context, index) {
          return Container(
              height: 800,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            image: DecorationImage(
                                image: NetworkImage(
                                    posts![index].authorProfileImage),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            posts![index].authorName,
                            style: CustomTextStyle.text2Style,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.timer, color: CustomColors.yellowColor,),
                              const SizedBox(width: 5,),
                              Text(posts![index]
                                  .createdAt
                                  .toString()
                                  .substring(0, 10)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: size.width * 0.90,
                          child: Text(
                            posts![index].description,
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.network(posts![index].media!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.thumb_up_alt_outlined, color: CustomColors.yellowColor,),
                            Text(posts![index].likeCount.toString())
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Icon(Icons.thumb_down_alt_outlined, color: Colors.yellow,),
                            Text(posts![index].disLikeCount.toString())
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                image: DecorationImage(
                                    image: NetworkImage(posts![index].comments![0].authorProfileImage),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                   posts![index].comments![0].authorName,
                                   style: CustomTextStyle.text2Style,
                                 ),

                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.7,
                                      child: Text(
                                        posts![index].comments![0].description,
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        style: CustomTextStyle.text4Style,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height:6,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        const Icon(Icons.thumb_up_alt_outlined, color: CustomColors.yellowColor,),
                                        Text(posts![index]
                                            .comments![0]
                                            .likeCount
                                            .toString())
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        const Icon(Icons.thumb_down_alt_outlined, color: CustomColors.yellowColor,),
                                        Text(posts![index]
                                            .comments![0]
                                            .disLikeCount
                                            .toString())
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Icon(Icons.restore_from_trash, color: CustomColors.yellowColor,),
                          ],
                        ),
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("diğer yorumları gör..."),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.yellow),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        posts![index].authorProfileImage),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    "Paylaşmak İstediğiniz Konu Hakkında Birşeyler Yazın...",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
