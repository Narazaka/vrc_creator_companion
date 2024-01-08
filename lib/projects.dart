import 'package:flutter/material.dart';
import 'package:open_dir/open_dir.dart';

final openDir = OpenDir();

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});
  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Projects'),
          actions: [
            IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
            FilledButton(
                child: const Text("Create New Project"), onPressed: () {}),
          ],
        ),
        body: DataTable(
          headingRowHeight: 30,
          columns: const [
            DataColumn(label: Icon(Icons.star)),
            DataColumn(label: Text("Project Name")),
            DataColumn(label: Text("Project Type")),
            DataColumn(label: Text("Unity")),
            DataColumn(label: Text("Last Modified")),
            DataColumn(label: Spacer()),
            DataColumn(label: Spacer()),
            DataColumn(label: Spacer())
          ],
          rows: [
            buildDataRow(
                name: "vrchat-foobar",
                path: "D:/foobar",
                type: ProjectType.avatar,
                unityVersion: "2019.4.31f1",
                lastModified: "a day ago"),
            buildDataRow(
                name: "vrchat-hoge",
                path: "D:/hoge",
                type: ProjectType.world,
                unityVersion: "2019.4.29f1",
                lastModified: "a day ago",
                opened: true),
          ],
        ));
  }

  DataRow buildDataRow({
    bool favorite = false,
    required String name,
    required String path,
    required ProjectType type,
    required String unityVersion,
    required String lastModified,
    bool opened = false,
  }) {
    return DataRow(cells: [
      DataCell(IconButton(icon: const Icon(Icons.star), onPressed: () {})),
      DataCell(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              path,
              style: const TextStyle(fontSize: 10),
            )
          ])),
      DataCell(
        switch (type) {
          ProjectType.avatar => const Row(children: [
              Icon(Icons.account_circle),
              Padding(padding: EdgeInsets.all(4)),
              Text("Avatar")
            ]),
          ProjectType.world => const Row(children: [
              Icon(Icons.language),
              Padding(padding: EdgeInsets.all(4)),
              Text("World")
            ])
        },
      ),
      DataCell(Text(unityVersion)),
      DataCell(Text(lastModified)),
      DataCell(opened
          ? OutlinedButton(
              child: const Text("Bring To Front"), onPressed: () {})
          : FilledButton(child: const Text("Open Project"), onPressed: () {})),
      DataCell(OutlinedButton(
          child: const Text("Manage Project"), onPressed: () {})),
      DataCell(MenuAnchor(
        builder: (context, controller, child) => IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () =>
                controller.isOpen ? controller.close() : controller.open()),
        menuChildren: [
          MenuItemButton(
              child: const Text("Open Project Folder"),
              onPressed: () {
                openDir.openNativeDir(path: path);
              }),
          MenuItemButton(child: const Text("Create Backup"), onPressed: () {}),
          MenuItemButton(
            style: MenuItemButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Remove Project"),
            onPressed: () {},
          ),
        ],
      ))
    ]);
  }
}

enum ProjectType { avatar, world }
