import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'song_list.dart';

class Playlist extends StatelessWidget {
  final index;
  final playlist;
  final library;
  final callback;

  Playlist(this.index, this.playlist, this.library, this.callback);

  int playlistDuration() {
    int totalLength = 0;
    playlist['songs'].forEach((song) {
      totalLength += song['duration'];
    });
    return totalLength;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(index.toString()),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          bool delete;
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[900],
              title: Text(
                'Delete Playlist?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              content: Text(
                'This action cannot be undone.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    delete = false;
                  },
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    delete = true;
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.yellowAccent),
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
              backgroundColor: Colors.grey[900],
              title: Text(
                'Rename Playlist?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              content: TextField(),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Rename',
                    style: TextStyle(color: Colors.yellowAccent),
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
          playlist['name'],
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        subtitle: Text(
          '${playlist['songs'].length} Songs, ${playlistDuration()} Minutes',
          style: TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text('Send Email'),
                    onTap: () {
                      launch('mailto:smith@example.org?subject=Check%20Out%20My%20New%20Playlist&body=Hey!%20Check%20out%20this%20new%20playlist%20I%20created%20using%20PlaylistFactory!%20https://playlistfactory.com/${playlist['name']}');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.sms),
                    title: Text('Send Whatsapp'),
                    onTap: () {
                      launch('https://api.whatsapp.com/send?text=Hey!%20Check%20out%20this%20new%20playlist%20I%20created%20using%20PlaylistFactory!%20https://playlistfactory.com/${playlist['name']}');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
          icon: Icon(
            Icons.share,
            color: Colors.yellowAccent,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SongList(
                index: index,
                playlist: playlist,
                library: library,
                callback: callback,
              ),
            ),
          );
        },
      ),
    );
  }
}
