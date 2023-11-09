import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rlnk_1/widgets/text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../pallete.dart';
import '../../../widgets/appbar/appbar_custom.dart';
import '../../../widgets/appbar/navigation_drawer.dart';
import 'setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      endDrawer: NavDrawer(),
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              // logo on Body
              Image.asset('assets/images/splashscreen/rlnk.png'),
              const SizedBox(
                height: 20,
              ),

              CustomTextField(
                hintText: 'API Key',
                controller: controller.apikey,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Pallete.gradient1,
                      Pallete.gradient2,
                      Pallete.gradient3,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Obx(
                  () => ElevatedButton.icon(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.makeHttpRequest(),
                    icon: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Icon(
                            Icons.save,
                            size: 30.0,
                          ),
                    label: Text(
                      controller.isLoading.value
                          ? 'processing'
                          : 'Save Api Key',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onHover: (value) {},
                onTap: () async {
                  Uri url = Uri.parse('https://www.rlnk.us/login/register.php');
                  launchUrl(url);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Center(
                    child: InkWell(
                      child: MouseRegion(
                        child: Obx(
                          () => Text(
                            controller.regsetting.value,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

// ==== Chat GPT ---------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: const Text("Enter ChatGpt Api Key"),
                  children: <Widget>[
                    CustomTextField(
                      hintText: 'ChatGpt Api Key',
                      controller: controller.apichatGpt,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Pallete.gradient1,
                            Pallete.gradient2,
                            Pallete.gradient3,
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Obx(
                        () => ElevatedButton.icon(
                          onPressed: controller.isLoading.value
                              ? null
                              : () => controller.chatGptAdd(),
                          icon: controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : const Icon(
                                  Icons.save,
                                  size: 30.0,
                                ),
                          label: Text(
                            controller.isLoading.value
                                ? 'processing'
                                : 'Save Chat GPT',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Button Get Url Shortener

              // Get Resonse  Email
              // Obx(
              //   () => Row(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(right: 20, left: 20),
              //         child: Text(
              //           controller.sname.value,
              //           style: const TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Get Resonse Email
              // Obx(() => Row(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(right: 20, left: 20),
              //           child: Text(
              //             controller.semail.value,
              //             style: const TextStyle(
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ),
              //       ],
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
