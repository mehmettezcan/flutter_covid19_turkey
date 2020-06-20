import 'package:covid19turkey/constants/app_theme.dart';
import 'package:covid19turkey/constants/strings.dart';
import 'package:covid19turkey/di/components/app_component.dart';
import 'package:covid19turkey/di/modules/local_module.dart';
import 'package:covid19turkey/di/modules/netwok_module.dart';
import 'package:covid19turkey/di/modules/preference_module.dart';
import 'package:covid19turkey/routes.dart';
import 'package:covid19turkey/stores/covid_store/continent_data_model/continent_data_store.dart';
import 'package:covid19turkey/stores/covid_store/corona_news_store/corona_news_store.dart';
import 'package:covid19turkey/stores/covid_store/covid_store.dart';
import 'package:covid19turkey/stores/covid_store/total_data_store/total_data_store.dart';
import 'package:covid19turkey/stores/language/language_store.dart';
import 'package:covid19turkey/stores/post/post_store.dart';
import 'package:covid19turkey/stores/theme/theme_store.dart';
import 'package:covid19turkey/ui/splash/splash.dart';
import 'package:covid19turkey/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:inject/inject.dart';
import 'package:provider/provider.dart';

// global instance for app component
AppComponent appComponent;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    appComponent = await AppComponent.create(
      NetworkModule(),
      LocalModule(),
      PreferenceModule(),
    );
    runApp(appComponent.app);
  });
}

@provide
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final ThemeStore _themeStore = ThemeStore(appComponent.getRepository());
  final PostStore _postStore = PostStore(appComponent.getRepository());
  final LanguageStore _languageStore =
      LanguageStore(appComponent.getRepository());
  final CovidStore _covidStore = CovidStore(appComponent.getRepository());
  final CoronaNewsStore _coronaNewsStore =
      CoronaNewsStore(appComponent.getRepository());
  final ContinentDataStore _continentDataStore =
      ContinentDataStore(appComponent.getRepository());
  final TotalDataStore _totalDataStore =
      TotalDataStore(appComponent.getRepository());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>.value(value: _themeStore),
        Provider<PostStore>.value(value: _postStore),
        Provider<LanguageStore>.value(value: _languageStore),
        Provider<CovidStore>.value(value: _covidStore),
        Provider<CoronaNewsStore>.value(value: _coronaNewsStore),
        Provider<ContinentDataStore>.value(value: _continentDataStore),
        Provider<TotalDataStore>.value(value: _totalDataStore),
      ],
      child: Observer(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: _themeStore.darkMode ? themeDataDark : themeData,
            routes: Routes.routes,
            locale: Locale(_languageStore.locale),
            supportedLocales: _languageStore.supportedLanguages
                .map((language) => Locale(language.locale, language.code))
                .toList(),
            localizationsDelegates: [
              // A class which loads the translations from JSON files
              AppLocalizations.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
            // Returns a locale which will be used by the app
            localeResolutionCallback: (locale, supportedLocales) =>
                // Check if the current device locale is supported
                supportedLocales.firstWhere(
                    (supportedLocale) =>
                        supportedLocale.languageCode == locale.languageCode,
                    orElse: () => supportedLocales.first),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
