import 'package:flutter/material.dart';
import 'package:iraqi_chemists_syndicate_law/core/app_constant.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_endpoint.dart';
import 'package:iraqi_chemists_syndicate_law/core/services/shared_prefrence/cach_helper.dart';
import 'package:iraqi_chemists_syndicate_law/core/setup.dart';
import 'package:iraqi_chemists_syndicate_law/my_app.dart';

void main() async {
  await setupApp();
  await CachHelper.setData(key: AppConstant.tokenKey, value: ApiEndpoint.token);

  runApp(const MyApp());
}
