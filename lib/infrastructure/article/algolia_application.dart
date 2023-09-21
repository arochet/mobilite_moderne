import 'package:mobilite_moderne/injection.config.dart';
import 'package:algolia/algolia.dart';

/// Configuration d'algolia
class AlgoliaApplication {
  static final Algolia algolia =
      Algolia.init(applicationId: 'PTYE9X0MA9', apiKey: '3352548ccb61e637a0de45678de465cf');
}
