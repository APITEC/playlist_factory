import 'package:flutter/material.dart';
import 'song.dart';
import 'library.dart';

class SongList extends StatefulWidget {
  final index;
  final playlist;
  final library;
  final callback;

  SongList({this.index, this.playlist, this.library, this.callback});

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.playlist['name'],
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.yellowAccent,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.playlist['songs'].length,
          itemBuilder: (context, index) {
            return Song(widget.playlist['songs'][index]);
          }),
      floatingActionButton: Library(widget.index, widget.playlist['songs'], widget.library, widget.callback),
    );
  }
}
