import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({required this.client, required this.id, required this.note});
  final http.Client client;
  final int id;
  final String note;
  @override
  State<UpdatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<UpdatePage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.note;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPDATE'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 10,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  int id = widget.id;
                  var UpdateUrl = 'http://127.0.0.1:8000/notes/$id/update/';
                  var url = Uri.parse(UpdateUrl);
                  widget.client.put(url, body: {'body': controller.text});
                  Navigator.pop(context);
                },
                child: const Text("UPDATE NOTE"))
          ],
        ),
      ),
    );
  }
}
