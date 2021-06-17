import 'package:flutter/material.dart';
import 'package:noteapp/Model/Note.dart';
import 'package:noteapp/Model/SecondScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title;
  String description;
  var ListNote = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          if (title.length > 0 && description.length > 0) {
            Note n1 = Note(
              title: title,
              description: description,
            );
            setState(() {
              ListNote.add(n1);
            });
          } else {}
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NoteApp",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    title = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Enter title...",
                ),
                style: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    description = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Enter description...",
                ),
                style: TextStyle(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Text(
                "Note List",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: ListNote.length,
                itemBuilder: (BuildContext context, int index) {
                  Note n1 = ListNote[index];
                  return GestureDetector(
                    onLongPress: () {
                      setState(() {
                        ListNote.removeAt(index);
                      });
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            title: n1.title,
                            description: n1.description,
                          ),
                        ),
                      );
                    },
                    child: showNote(n1),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget showNote(Note n1) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          n1.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          n1.description.length > 10
              ? n1.description.substring(0, 10) + "...."
              : n1.description,
          //n1.description.substring(0, 5) + ".......",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

// Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: ListTile(
//                   title: Text(
//                     "title",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   subtitle: Text(
//                     "description",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
