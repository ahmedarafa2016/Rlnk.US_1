import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rlnk_1/globalf.dart';

class SettingController extends GetxController {
  final glb = Globalf();

  TextEditingController apikey = TextEditingController();
  TextEditingController apichatGpt = TextEditingController();

  final isLoading = false.obs;

  final Map<String, String> params = {
    'ver': '1',
    'action': 'auth',
    'key': '',
  };

  RxString sname = ''.obs;
  RxString semail = ''.obs;
  RxString regsetting = ''.obs;

  @override
  void onInit() {
    super.onInit();
    apikey.text = glb.getkey();
    apichatGpt.text = glb.getkeyChat();

    if (glb.getkey() != "") {
      regsetting.value = '';
    } else {
      regsetting.value = 'Register for Api Key';
    }
  }

// post Url Request
  makeHttpRequest() async {
    if (apikey.text != '') {
      isLoading.value = true;

      params['key'] = apikey.text;
      final response = await glb.postData(jsonEncode(params));
      final jsonResponse = jsonDecode(response);
      isLoading.value = false;

      if (jsonResponse['status'] == "success") {
        semail.value = jsonResponse['email'];
        sname.value = jsonResponse['name'];
        glb.savekey(apikey.text);
        glb.savename(sname.value);
        glb.saveemail(semail.value);
        regsetting.value = '';

        glb.geterrmsg(jsonResponse['message']);

        sname.value = 'User Name : ${sname.value}';
        semail.value = 'User Email : ${semail.value}';
      } else {
        glb.geterrmsg(jsonResponse['message']);
        glb.savekey('');
        glb.savename('');
        glb.saveemail('');
        regsetting.value = 'Register for Api Key';
      }
    } else {
      glb.geterrmsg('Clear Api Key Data');

      glb.savekey('');
      glb.savename('');
      glb.saveemail('');
    }
  }

//Add Cht
  chatGptAdd() {
    if (apichatGpt.text != '') {
      isLoading.value = true;
      glb.savekeyChat(apichatGpt.text);
      glb.geterrmsg('Saved ChatGpt Key Data');
      print('------------' + glb.getkeyChat());
      isLoading.value = false;
    } else {
      glb.geterrmsg('Clear Chat Gpt Key Data');
      glb.savekeyChat('');
      isLoading.value = true;
    }
  }
}
