import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';
import '../../../widgets/gradientrlnk.dart';
import 'statistic_controller.dart';

class StatisticView extends GetView<StatisticController> {
  const StatisticView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.recent);
          },
        ),
        title: const Center(
          child: Text(
            'Rlnk.Us - > Statatistics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        flexibleSpace: const CradientRlnk(),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/icons/32.png',
              ),
            ),
          ),
        ],

        // actions: [],
      ),
      // endDrawer: const NavDrawer(),
      // appBar: const MyAppBar(),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  controller.slnk.value,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                ),
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.allhits.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: ListTile(
                              leading: Column(
                                children: [
                                  Text(controller
                                      .allhits.data![index].cbrowser!),
                                  Text(controller.allhits.data![index].timeid!),
                                ],
                              ),
                              title: //
                                  Text(controller
                                      .allhits.data![index].cplatform!),
                              subtitle:
                                  Text(controller.allhits.data![index].aip!),
                              trailing: Text(
                                  controller.allhits.data![index].country!),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
