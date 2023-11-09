import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rlnk_1/pallete.dart';
import 'package:rlnk_1/app/modules/rlnkview/rlnk_view_controller.dart';
import 'package:rlnk_1/widgets/text_field.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/appbar/appbar_custom.dart';
import '../../../widgets/appbar/navigation_drawer.dart';

class RlnkView extends GetView<RlnkController> {
  @override
  const RlnkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavDrawer(),
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: controller.formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                // Image on top Page
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    right: 15,
                    left: 15,
                  ),
                  child: Image.asset(
                    'assets/images/api_lnk.png',
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                //  Url TextField
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Pallete.gradient2,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Url',
                        prefixIcon: const Icon(Icons.add_link_sharp)),
                    controller: controller.urlController,
                    validator: (value) => controller.validateUrl(value!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                  ),
                  child: CustomTextField(
                    hintText: 'Title - Optional',
                    controller: controller.titleiController,
                  ),
                ),

                //  API Key TextField
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  child: CustomTextField(
                    hintText: 'API Key',
                    controller: controller.urlApiController,
                  ),
                ),

                ExpansionTile(
                  title: const Text("Pin Url number"),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                        left: 15,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 6,
                        decoration: const InputDecoration(
                          labelText: "Pin Url",
                          icon: Icon(Icons.key),
                        ),
                        controller: controller.urlpinController,
                        validator: (value) =>
                            controller.validatepincode(value!),
                      ),
                    )
                  ],
                ),
// Register for Api Key
                InkWell(
                  onHover: (value) {},
                  onTap: () async {
                    Uri url =
                        Uri.parse('https://www.rlnk.us/login/register.php');
                    launchUrl(url);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: Center(
                      child: InkWell(
                        child: Text(
                          controller.regrlnk.value,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Button Get Url Shortener
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
                              Icons.add_link_sharp,
                              size: 30.0,
                            ),
                      label: Text(
                        controller.isLoading.value
                            ? 'processing'
                            : 'Get Url Shortener',
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
                // Get Resonse Text message
                Obx(() => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          controller.messageText.value,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
                // Get Resonse URL Shortener - Share Icons
                Obx(() => Row(
                      children: [
                        const Spacer(
                          flex: 4,
                        ),
                        // Get Url and open shortidText when Click
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Uri url =
                                    Uri.parse(controller.shortidText.value);
                                launchUrl(url);
                              },
                              child: Text(
                                controller.shortidText.value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        //Share Icons
                        Column(
                          children: [
                            //Share URL to ather App
                            GestureDetector(
                              onTap: () async {
                                await Share.share(controller.shortidText.value,
                                    subject: controller.shortidText.value,
                                    sharePositionOrigin:
                                        const Rect.fromLTRB(10, 10, 10, 20));
                              },
                              // Icon Share URL
                              child: Row(
                                children: [
                                  Icon(
                                      controller.qrpics.isNotEmpty
                                          ? Icons.share
                                          : null,
                                      size: 20)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    )),

                // Get Resonse QrCode Iamge -  Share to other
                Obx(() => Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            const Spacer(
                              flex: 5,
                            ),

                            // Get Qr Code Image
                            Column(
                              children: [
                                Container(
                                  child: controller.qrpics.isNotEmpty
                                      ? Image.memory(
                                          base64Decode(controller.qrpics.value))
                                      : const Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            // Get Share Qr Code Image to oheer program
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    Uint8List bytes =
                                        base64.decode(controller.qrpics.value);
                                    final documentDirectory =
                                        await getApplicationDocumentsDirectory();
                                    String imagename =
                                        bytes.hashCode.toRadixString(16);
                                    final file = File(
                                        "${documentDirectory.path}/$imagename.png");
                                    file.writeAsBytesSync(bytes);
                                    XFile fileForShare = XFile(file.path);
                                    await Share.shareXFiles([fileForShare],
                                        text: controller.shortidText.value,
                                        subject: "https://rlnk.us/");
                                  },
                                  // Icon Share QrCode
                                  child: Row(
                                    children: [
                                      Icon(
                                          controller.qrpics.isNotEmpty
                                              ? Icons.share
                                              : null,
                                          size: 20)
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(
                              flex: 3,
                            ),
                          ],
                        ),
                      ),
                    )),

                // Get Resonse Text Expire Date
                Obx(() => Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Center(
                        child: Text(
                          controller.expireText.value,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}