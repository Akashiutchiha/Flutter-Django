import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  CreatePage({required this.client});
  final http.Client client;
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  var CreateUrl = 'http://127.0.0.1:8000/notes/create/';
                  var url = Uri.parse(CreateUrl);
                  widget.client.post(url, body: {'body': controller.text});
                  Navigator.pop(context);
                },
                child: Text("ADD NOTE"))
          ],
        ),
      ),
    );
  }
}
