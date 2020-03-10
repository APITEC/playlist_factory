import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Playlist extends StatelessWidget {
  final key;
  final name;
  final songs;

  Playlist(this.key, this.name, this.songs);

  int playlistDuration() {
    int totalLength = 0;
    songs.forEach((song) {
      totalLength += song['duration'];
    });
    return totalLength;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          bool delete;
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Delete Playlist?'),
              content: Text('This action cannot be undone.'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    delete = false;
                  },
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    delete = true;
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          );
          return delete;
        } else {
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Rename Playlist?'),
              content: TextField(),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Rename',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
          return false;
        }
      },
      background: Container(
        color: Colors.yellowAccent,
      ),
      secondaryBackground: Container(
        color: Colors.redAccent,
      ),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        subtitle: Text(
          '${songs.length} Songs, ${playlistDuration()} Minutes',
          style: TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          onPressed: () {
            launch('https://api.whatsapp.com/send?text=Hey!%20Check%20out%20this%20new%20playlist%20I%20created%20using%20PlaylistFactory!%20https://playlistfactory.com/$name');
          },
          icon: Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
