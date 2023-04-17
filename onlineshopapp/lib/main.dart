import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlineshopapp/create.dart';
import 'package:onlineshopapp/update.dart';

import 'note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Django CRUD'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client client = http.Client();
  List<Note> notes = [];

  void _addNote() {}

  void _retrieveNotes() async {
    notes = [];
    var retrieveUrl = 'http://127.0.0.1:8000/notes';
    var url = Uri.parse(retrieveUrl);
    List response = jsonDecode((await client.get(url)).body);
    for (var element in response) {
      notes.add(Note.fromMap(element));
    }
    setState(() {
      notes = notes;
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveNotes();
  }

  void _deleteNote(int id) {
    var deleteUrl = 'http://127.0.0.1:8000/notes/$id/delete/';
    var url = Uri.parse(deleteUrl);
    client.delete(url);
    _retrieveNotes();
  }

  // void _addNote() {}

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          _retrieveNotes();
          return Future.value();
        },
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdatePage(
                      client: client,
                      id: notes[index].id,
                      note: notes[index].note,
                    ),
                  ),
                );
              },
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteNote(notes[index].id),
              ),
              title: Text("${index + 1}" + " " + notes[index].note),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreatePage(
                      client: client,
                    )),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
