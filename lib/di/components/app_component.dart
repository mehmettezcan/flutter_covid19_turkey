import 'package:covid19turkey/data/repository.dart';
import 'package:covid19turkey/di/modules/local_module.dart';
import 'package:covid19turkey/di/modules/netwok_module.dart';
import 'package:covid19turkey/di/modules/preference_module.dart';
import 'package:covid19turkey/main.dart';
import 'package:inject/inject.dart';

import 'app_component.inject.dart' as g;

/// The top level injector that stitches together multiple app features into
/// a complete app.
@Injector(const [NetworkModule, LocalModule, PreferenceModule])
abstract class AppComponent {
  @provide
  MyApp get app;

  static Future<AppComponent> create(
    NetworkModule networkModule,
    LocalModule localModule,
    PreferenceModule preferenceModule,
  ) async {
    return await g.AppComponent$Injector.create(
      networkModule,
      localModule,
      preferenceModule,
    );
  }

  /// An accessor to RestClient object that an application may use.
  @provide
  Repository getRepository();
}
