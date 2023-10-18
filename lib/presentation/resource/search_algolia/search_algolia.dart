import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/resource/algolia_application.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/resource/resource_dtos.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/component/resource_tile.dart';
import 'package:mobilite_moderne/providers.dart';

class SearchAlgolia extends ConsumerStatefulWidget {
  final Widget child;
  SearchAlgolia({Key? key, required this.child}) : super(key: key);

  @override
  _SearchAlgoliaState createState() => _SearchAlgoliaState();
}

class _SearchAlgoliaState extends ConsumerState<SearchAlgolia> {
  late TextEditingController _searchController;

  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: 'SearchAlgolia',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: _searchController,
              onChanged: (String value) {
                if (value.length > 0) {
                  setState(() {
                    _isSearching = true;
                  });
                } else {
                  setState(() {
                    _isSearching = false;
                  });
                }
              },
              decoration: InputDecoration(
                hintText: 'Rechercher',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SpaceH20(),
          if (!_isSearching) Expanded(child: widget.child),
          if (_isSearching)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: _SearchResults(_searchController.text),
              ),
            ),
        ],
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  final String search;
  final Algolia _algoliaApp = AlgoliaApplication.algolia;
  _SearchResults(
    this.search, {
    super.key,
  });

  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    AlgoliaQuery query = _algoliaApp.instance.index('DistAtelier').query(input);
    AlgoliaQuerySnapshot snap = await query.getObjects();
    return snap.hits;
  }

  @override
  Widget build(BuildContext context) {
    //On recherche dans la base de donnée Algolia !
    return ShowComponentFile(
      title: '_SearchResults',
      child: StreamBuilder(
          stream: Stream.fromFuture(_operation(search)),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            else {
              List<AlgoliaObjectSnapshot> _results = snapshot.data as List<AlgoliaObjectSnapshot>;

              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  return _ListResults(results: _results);
              }
            }
          }),
    );
  }
}

class _ListResults extends ConsumerWidget {
  const _ListResults({
    super.key,
    required List<AlgoliaObjectSnapshot> results,
  }) : _results = results;

  final List<AlgoliaObjectSnapshot> _results;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageRef = ref.watch(resourceRepositoryProvider).storageRef;
    return ListView.builder(
      itemCount: _results.length < 50 ? _results.length : 50,
      itemBuilder: (context, index) {
        Resource resource = ResourceDTO.fromJson(_results[index].data).toDomain(storageRef);
        return ResourceTile(resource: resource);
      },
    );
  }
}
