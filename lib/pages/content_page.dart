import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controllers/data_controller.dart';
import 'package:learn_getx/routes/routes_names.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      return Scaffold(
        backgroundColor: const Color(0xFFc5e5f3),
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: const Color(0xFFc5e5f3),
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(Icons.arrow_back_ios, size: 18),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Card
            Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFebf8fd),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(controller.dataList.first.img),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.dataList.first.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF3b3f42),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Top Level",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffdcb216),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFf3fafc),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Color(0xFF69c5df),
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            _sectionHeader("Popular Contest"),
            const SizedBox(height: 20),

            // Popular Contest Slider
            SizedBox(
              height: 220,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: controller.dataList.length.clamp(0, 4),
                itemBuilder: (_, i) {
                  final contest = controller.dataList[i];
                  return GestureDetector(
                    onTap: () {
                      controller.updateTempList(i);
                      Get.toNamed(RoutesNames.getDetailPage(i));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: i.isEven
                            ? const Color(0xFF69c5df)
                            : const Color(0xFF9294cc),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contest.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            contest.text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFb8eefc),
                            ),
                          ),
                          const Spacer(),
                          const Divider(color: Colors.white70),
                          const SizedBox(height: 6),
                          CircleAvatar(
                            radius: 26,
                            backgroundImage: AssetImage(contest.img),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            _sectionHeader("Recent Contests"),
            const SizedBox(height: 20),

            // Recent Contest List
            Expanded(
              child: ListView.builder(
                itemCount: controller.dataList.length,
                itemBuilder: (_, i) {
                  final contest = controller.dataList[i];
                  return GestureDetector(
                    onTap: () {
                      controller.updateTempList(i);
                      Get.toNamed(RoutesNames.getDetailPage(i));
                    },
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFebf8fd),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(contest.img),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contest.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xffdcb216),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  contest.text,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF3b3f42),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8),
                          Text(
                            contest.time,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
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
          ],
        ),
      );
    });
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, color: Color(0xFF1f2326)),
            ),
          ),
          const SizedBox(width: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Show all",
                style: TextStyle(fontSize: 15, color: Color(0xffc1c786)),
              ),
              const SizedBox(width: 5),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: const Color(0xFFfdc33c),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
