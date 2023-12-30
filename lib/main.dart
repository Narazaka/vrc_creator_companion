import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:vrc_creator_companion/learn.dart';
import 'package:vrc_creator_companion/logs.dart';
import 'package:vrc_creator_companion/projects.dart';
import 'package:vrc_creator_companion/settings.dart';
import 'package:vrc_creator_companion/tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: MyHomePage(
          controller: SidebarXController(
        selectedIndex: 0,
        extended: true,
      )),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.controller});

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            controller: controller,
            showToggleButton: false,
            items: const [
              SidebarXItem(icon: Icons.dashboard, label: "Projects"),
              SidebarXItem(icon: Icons.help_center, label: "Learn"),
              SidebarXItem(icon: Icons.home_repair_service, label: "Tools"),
            ],
            footerItems: const [
              SidebarXItem(icon: Icons.description, label: "Logs"),
              SidebarXItem(icon: Icons.settings, label: "Settings"),
            ],
            theme: const SidebarXTheme(
              margin: EdgeInsets.all(10),
              itemTextPadding: EdgeInsets.only(left: 10),
              selectedItemTextPadding: EdgeInsets.only(left: 10),
            ),
            extendedTheme:
                const SidebarXTheme(width: 150, margin: EdgeInsets.all(10)),
          ),
          Expanded(
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) => const [
                        ProjectsView(),
                        LearnView(),
                        ToolsView(),
                        LogsView(),
                        SettingsView()
                      ][controller.selectedIndex]))
        ],
      ),
    );
  }
}
