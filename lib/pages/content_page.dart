import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        color: Color(0xFFc5e5f3),
        child: Column(
          children: [
            //james smith
            Container(
              width: width,
              height: 100,
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFebf8fd),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("images/background.jpg"),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "James Smith",
                          style: TextStyle(
                            color: Color(0xFF3b3f42),
                            fontSize: 18,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Top Level",
                          style: TextStyle(
                            color: Color(0xffdcb216),
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFf3fafc),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.notifications,
                          color: Color(0xFF69c5df),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            //popular contest
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    "Popular Contest",
                    style: TextStyle(
                      color: Color(0xFF1f2326),
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Text(
                        "Show all",
                        style: TextStyle(
                          color: Color(0xffc1c786),
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
                      ),

                      const SizedBox(width: 5),
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xFFfdc33c),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //list
            SizedBox(
              height: 220,
              width: width,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: 4,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () => Get.toNamed("/detail"),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      height: 220,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: i.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Title",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: width,
                            child: Text(
                              "Text",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFb8eefc),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Divider(thickness: 1.0),
                          Row(
                            children: [
                              for (int i = 0; i < 4; i++)
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "images/background.jpg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            //recent contests
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    "Recent Contests",
                    style: TextStyle(
                      color: Color(0xFF1f2326),
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "Show all",
                          style: TextStyle(
                            color: Color(0xffc1c786),
                            fontSize: 15,
                            decoration: TextDecoration.none,
                          ),
                        ),

                        const SizedBox(width: 5),
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0xFFfdc33c),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder: (_, i) {
                    return Container(
                      width: width,
                      height: 100,
                      margin: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFebf8fd),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                "images/background.jpg",
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Status",
                                  style: TextStyle(
                                    color: Color(0xffdcb216),
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Text",
                                  style: TextStyle(
                                    color: Color(0xFF3b3f42),
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "Time",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: .w600,
                                decoration: TextDecoration.none,
                                color: Color(0xff93adbe),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
