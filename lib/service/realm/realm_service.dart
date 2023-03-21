import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:test_android_programming_apps/shared/shared_config.dart';
import 'package:test_android_programming_apps/service/authentication/auth_service.dart';

class RealmService {
  static late App app;
  static late AppConfiguration appConfiguration;
  static init() {
    Map realmConfig = {
      "appId": SharedConfig.appId,
      "appUrl": SharedConfig.appUrl,
      "baseUrl": SharedConfig.baseUrl,
      "dataSourceName": SharedConfig.dataSourceName,
    };

    String appId = realmConfig["appId"];
    appConfiguration = AppConfiguration(appId);
    app = App(appConfiguration);
  }

  static bool syncronized = false;
  static Future syncronizeAll() async {
    if (AuthService.currentUser == null) return;
    syncronized = false;
    await RealmSyncronizer.syncronize();
    syncronized = true;
  }
}

extension RealmSyncronizerWidget on Widget {
  syncronizeRealm() {
    if (RealmService.syncronized) return this;
    return FutureBuilder(
      future: RealmService.syncronizeAll(),
      builder: (context, snapshot) {
        return this;
      },
    );
  }
}
