import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
//import 'package:mobilite_moderne/PRESENTATION/resource/resource_videoplayer/resource_videoplayer_page.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

@RoutePage()
class VideoplayerPage extends ConsumerWidget {
  final String path;
  VideoplayerPage(this.path, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
        title: 'Video',
        child: ShowComponentFile(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: AppFutureBuilder(
              future: ref.watch(resourceRepositoryProvider).getDocumentURL(path),
              builder: (eitherUrl) =>
                  eitherUrl?.fold(
                    (l) => Center(child: Text(l.toString())),
                    (url) => VideoApp(url),
                  ) ??
                  Center(child: Text("Aucun document disponible pour cette catégorie")),
              error: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Une erreur est survenue avec la video '${path}'",
                    textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium),
              )),
            ),
          ),
        ));
  }
}

class VideoApp extends StatefulWidget {
  final String url;
  const VideoApp(this.url, {super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      aspectRatio: 9 / 16 as double,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.width * 16 / 9,
          width: MediaQuery.of(context).size.width,
          child: Chewie(controller: _chewieController),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
