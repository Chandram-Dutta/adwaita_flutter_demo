import 'package:adwaita_flutter_demo/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lightThemeProvider = StateProvider((_) => LightTheme().lightTheme);
final darkThemeProvider = StateProvider((_) => DarkTheme().darkTheme);

void main() {
  runApp(const ProviderScope(child: MyHomePage()));
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// 2. Extend [ConsumerState]
class _MyHomePageState extends ConsumerState<MyHomePage> {
  ThemesCharacter? _character = ThemesCharacter.material;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ref.watch(lightThemeProvider),
      darkTheme: ref.watch(darkThemeProvider),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Linux Themes"),
        ),
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          ref.watch(darkThemeProvider).colorScheme.secondary),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              height: 150,
              width: 400,
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Default'),
                    leading: Radio<ThemesCharacter>(
                      value: ThemesCharacter.material,
                      groupValue: _character,
                      onChanged: (ThemesCharacter? value) {
                        setState(() {
                          ref.read(lightThemeProvider.state).state =
                              LightTheme().lightTheme;
                          ref.read(darkThemeProvider.state).state =
                              DarkTheme().darkTheme;
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Yaru'),
                    leading: Radio<ThemesCharacter>(
                      value: ThemesCharacter.yaru,
                      groupValue: _character,
                      onChanged: (ThemesCharacter? value) {
                        setState(() {
                          ref.read(lightThemeProvider.state).state =
                              LightTheme().yaruLight;
                          ref.read(darkThemeProvider.state).state =
                              DarkTheme().yaruDark;
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Adwaita'),
                    leading: Radio<ThemesCharacter>(
                      value: ThemesCharacter.adwaita,
                      groupValue: _character,
                      onChanged: (ThemesCharacter? value) {
                        setState(() {
                          ref.read(lightThemeProvider.state).state =
                              LightTheme().adwaitaLight;
                          ref.read(darkThemeProvider.state).state =
                              DarkTheme().adwaitaDark;
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

enum ThemesCharacter { material, yaru, adwaita }
