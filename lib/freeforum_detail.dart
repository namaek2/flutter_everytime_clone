import 'package:flutter/material.dart';
import 'home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'home_page.dart';
import 'login.dart';
import 'color.dart';
import 'app.dart';
import 'User.dart';
import 'login.dart';
import 'package:flutter/cupertino.dart';
import 'Post.dart';
import 'freeforum.dart';

class freeForumDetail extends StatefulWidget {
  BuildContext context;
  final Post post;
  freeForumDetail(this.context, this.post);

  @override
  State<freeForumDetail> createState() => _freeForumDetailState();
}

class _freeForumDetailState extends State<freeForumDetail> {
  late TextEditingController _controllerB;

  @override
  void initState() {
    _controllerB = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int like = widget.post.like;
    final int comment = widget.post.comment.length;
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Stack(children: [
              CupertinoNavigationBarBackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xff252532),
              ),
            ]),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Container(
                  color: Colors.white,
                  width: 420,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Image.asset('assets/profile.jpg',
                                      height: 50, width: 50),
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.post.writer,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(widget.post.time + " 02:02",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13.0,
                                              )),
                                        ],
                                      )
                                    ]),
                              ]),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: likeWidget(
                                        CupertinoIcons.hand_thumbsup, "공감"),
                                    onTap: () {
                                      setState(() {
                                        widget.post.like++;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child:
                                        likeWidget(CupertinoIcons.star, "스크랩"),
                                    onTap: () {
                                      setState(() {});
                                    },
                                  ),
                                ],
                              )
                            ]),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.post.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.post.contents,
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.hand_thumbsup,
                                    color: Palette.everyRed,
                                    size: 14,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "$like",
                                    style: TextStyle(
                                        color: Palette.everyRed,
                                        fontSize: 14.0),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Icon(
                                    CupertinoIcons.chat_bubble,
                                    color: Colors.blueAccent,
                                    size: 14,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "$comment",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 14.0),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Icon(
                                    CupertinoIcons.star,
                                    color: Colors.orangeAccent,
                                    size: 14,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "$comment",
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 430,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        for (int i = 0; i < widget.post.comment.length; i++)
                          commentBox(widget.post.comment[i], i),
                      ],
                    ),
                  )),
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.only(
              left: 10.0, right: 10.0, bottom: keyboard > 0 ? 15 : 35),
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: TextField(
              controller: _controllerB,
              cursorColor: Colors.grey,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  prefixIcon: Container(
                      width: 80,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 15.0),
                            Icon(CupertinoIcons.checkmark_square_fill,
                                color: Palette.everyRed, size: 17),
                            SizedBox(width: 5.0),
                            Text(
                              "익명",
                              style: TextStyle(
                                  color: Palette.everyRed,
                                  fontWeight: FontWeight.bold),
                            ),
                          ])),
                  suffixIcon: IconButton(
                    icon: Icon(CupertinoIcons.paperplane,
                        color: Palette.everyRed),
                    onPressed: () {},
                    iconSize: 24.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2)),
                  contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                  hintText: "댓글을 입력하세요."),
              onSubmitted: (String value) async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog();
                  },
                );
              },
            ),
          ),
        ));
  }
}

Widget likeWidget(IconData icon, String title) {
  return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 15,
            color: Colors.grey,
          ),
          SizedBox(width: 3),
          Text(title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ))
        ],
      ));
}

Widget commentBox(String comment, int num) {
  int number = num + 1;
  return Padding(
    padding: const EdgeInsets.only(left: 6, top: 10),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/profile.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '익명$number',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              Row(
                children: [
                  Container(
                      height: 30,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 3),
                          Icon(
                            CupertinoIcons.chat_bubble,
                            size: 15,
                            color: Colors.grey,
                          ),
                          VerticalDivider(
                            thickness: 0.4,
                            color: Colors.grey,
                          ),
                          Icon(
                            CupertinoIcons.hand_thumbsup,
                            size: 15,
                            color: Colors.grey,
                          ),
                          VerticalDivider(
                            thickness: 0.4,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.more_vert,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 3),
                        ],
                      )),
                ],
              ),
            ],
          ),
          Text(
            comment,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(height: 4),
          Text(
            "11/17 02:30",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 430,
            height: 0.4,
            color: Colors.grey,
          ),
          SizedBox(height: 3),
        ]),
  );
}