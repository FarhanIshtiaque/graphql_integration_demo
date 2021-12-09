import 'package:flutter/foundation.dart';
import 'package:flutter_with_graphql/constants/url.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EndPoint {
  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> _client = ValueNotifier(GraphQLClient(
      link: HttpLink(endpointUrl),
      cache: GraphQLCache(store: HiveStore()),
    ));

    return _client;
  }
}
