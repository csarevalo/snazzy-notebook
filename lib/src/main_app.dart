import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:my_crazy_notes_v0_1/src/settings/settings_controller.dart';

import 'app_home/home_screen.dart';
// import 'app_home/services/my_custom_scroll_behavior.dart';
import 'app_state/my_app_state.dart';
import 'settings/settings_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider(
          create: (context) => MyAppState(),
          child: MaterialApp(
            // Remove Debug Banner
            debugShowCheckedModeBanner: false,

            // // Change drag behavior to include all dragDevices
            // // -- may not be recommended
            // scrollBehavior: MyCustomScrollBehavior(),

            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'), // English, US country code
              Locale('es', ''), // Spanish, no country code
            ],

            locale: const Locale('en'),

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    //TODO: figure out how to work with routeNames

                    // case NotebooksScreen.routeName:
                    //   return const NotebooksScreen();
                    // case SampleNotebooksGridview.routeName:
                    //   return const SampleNotebooksGridview();
                    default:
                      return HomePage(settingsController: settingsController);
                  }
                },
              );
            },

            //if this doesn't work, try with builder
            // home: const Home(),
          ),
        );
      },
    );
  }
}
