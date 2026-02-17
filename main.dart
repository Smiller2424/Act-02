import 'package:flutter/material.dart';

void main() {
  runApp(const RunMyApp());
}

/// Root widget of the application.
/// Uses StatefulWidget because the theme can change at runtime.
class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  /// Tracks the current theme mode (Light or Dark)
  ThemeMode _themeMode = ThemeMode.light;

  /// Updates the theme mode and triggers a rebuild to apply the new theme
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Demo',

      // LIGHT THEME 
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[200],
        colorScheme: const ColorScheme.light(
          secondary: Colors.grey, // Circle color in light mode
        ),
      ),

      //  DARK THEME 
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          secondary: Colors.white, // Circle color in dark mode
        ),
      ),

      // Connects the theme state to the entire app
      themeMode: _themeMode,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Demo'),
          centerTitle: true,
        ),

        //  MAIN UI 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150),
                ),
                child: AnimatedContainer(
                  //  Smooth animated transition
                  duration: const Duration(milliseconds: 500),
                  height: 250,
                  width: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // Theme-driven color 
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'Mobile App Development Testing',
                    textAlign: TextAlign.center,
                    // Text adapts automatically to theme
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Choose the Theme:',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 10),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _themeMode == ThemeMode.dark
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                  ),
                  Switch(
                    value: _themeMode == ThemeMode.dark,
                    onChanged: (isDark) {
                      changeTheme(
                        isDark ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}