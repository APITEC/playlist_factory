import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  final index;
  final songs;
  final library;
  final callback;

  Library(this.index, this.songs, this.library, this.callback);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
          context: context,
          builder: (context) => ListView.builder(
              itemCount: widget.library.length,
              itemBuilder: (context, index) {
                Map matchingSong = widget.songs.firstWhere((playlistSong) => (widget.library[index]['name'] == playlistSong['name']), orElse: () => null);
                if (matchingSong != null) {
                  return SongTile(
                    index: widget.index,
                    song: widget.library[index],
                    selected: true,
                    callback: widget.callback,
                  );
                } else {
                  return SongTile(
                    index: widget.index,
                    song: widget.library[index],
                    selected: false,
                    callback: widget.callback,
                  );
                }
              }),
        );
      },
      backgroundColor: Colors.yellowAccent,
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}

// Extracted list tile and gave it state to keep track of selected songs.
class SongTile extends StatelessWidget {
  final index;
  final song;
  final selected;
  final callback;

  SongTile({this.index, this.song, this.selected, this.callback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        callback(index, song);
      },
      leading: Icon(selected ? Icons.check_box : Icons.check_box_outline_blank),
      title: Text(song['name']),
      subtitle: Text(song['artist']),
      trailing: IconButton(
          icon: Icon(
            Icons.favorite,
            color: Colors.pinkAccent,
          ),
          onPressed: () {}),
    );
  }
}
