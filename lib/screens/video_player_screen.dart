import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_video/models/videos_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class VieoPlayerScreen extends StatefulWidget{
  VieoPlayerScreen({this.videoItem});
  final VideoItem videoItem;
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VieoPlayerScreen>{
  YoutubePlayerController _controller;
  bool _isPlayerReady;

  @override
  void initState() {
    super.initState();
    _isPlayerReady = false;
    _controller = YoutubePlayerController(initialVideoId: widget.videoItem.video.resourceId.videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    )..addListener(_listener);
  }

  void _listener(){
    if(_isPlayerReady && mounted && !_controller.value.isFullScreen){

    }
  }

  @override
  void deactivate() {
    super.deactivate();
    _controller.pause();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(widget.videoItem.video.title),
     ),
     body: Container(
       child: YoutubePlayer(
         controller: _controller,
         showVideoProgressIndicator: true,

         onReady: (){
           print('Player is ready');
           _isPlayerReady = true;
         },
       ),
     ),
   );
  }

}