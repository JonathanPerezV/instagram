import 'package:flutter/material.dart';
import 'package:instagram/utils/wechat_camera_picker.dart';

import '../utils/insta_picker_interface.dart';
import '../utils/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<InstaPickerInterface> pickers = [const WeChatCameraPicker()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insta pickers'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PostsPage()),
            ),
            icon: Icon(Icons.feed, semanticLabel: 'Feed'),
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          final PickerDescription description = pickers[index].description;

          return Card(
            child: ListTile(
              leading: Text(description.icon),
              title: Text(description.label),
              subtitle: description.description != null
                  ? Text(description.description!)
                  : null,
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => pickers[index]),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 4),
        itemCount: pickers.length,
      ),
    );
  }
}
