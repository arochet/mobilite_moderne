import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/resource/algolia_application.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/resource/resource_dtos.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/component/resource_tile.dart';
import 'package:mobilite_moderne/providers.dart';

final currentOnglet = StateProvider<ResourceMainCategory>((ref) => ResourceMainCategory.mediatheque);

class SearchAlgolia extends ConsumerStatefulWidget {
  final Widget child;
  final TabController? controller;
  SearchAlgolia({Key? key, required this.child, this.controller}) : super(key: key);

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
      child: DefaultTabController(
        length: 3,
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
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SpaceH20(),
            // CHOIX DU TYPE DE RESSOURCE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TabBar(
                onTap: (value) {
                  ref.read(currentOnglet.notifier).state = ResourceMainCategory.values[value];
                },
                controller: widget.controller,
                tabs: ResourceMainCategory.values.map((e) {
                  return Tab(text: e.titleBar);
                }).toList(),
              ),
            ),
            SpaceH10(),

            // BODY
            if (!_isSearching) Expanded(child: widget.child),

            //RESULTAT DE LA RECHERCHE
            if (_isSearching)
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                    child: _SearchResults(_searchController.text, ref.watch(currentOnglet))),
              ),
          ],
        ),
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  final String search;
  final ResourceMainCategory mode;
  final Algolia _algoliaApp = AlgoliaApplication.algolia;
  _SearchResults(
    this.search,
    this.mode, {
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
                  return _ListResults(results: _results, mode: mode);
              }
            }
          }),
    );
  }
}

class _ListResults extends ConsumerWidget {
  final ResourceMainCategory mode;
  const _ListResults({
    super.key,
    required List<AlgoliaObjectSnapshot> results,
    required this.mode,
  }) : _results = results;

  final List<AlgoliaObjectSnapshot> _results;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageRef = ref.watch(resourceRepositoryProvider).storageRef;

    //Tri des résultats par catégorie
    List<Resource> listResources = _results
        .map((e) => ResourceDTO.fromJson(e.data).toDomain(storageRef))
        .where((res) => res.mainCategory == mode)
        .toList();

    //Limite à 10 résultats
    listResources = listResources.sublist(0, listResources.length > 10 ? 10 : listResources.length);

    if (listResources.length == 0)
      return Center(
          child: Text(
        'Aucun résultat trouvé',
        style:
            Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ));

    //Affichage des résultats
    return ListView(
      children: listResources.map((resource) => ResourceTile(resource: resource)).toList(),
    );
  }
}
