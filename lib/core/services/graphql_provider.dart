import 'dart:developer';
import 'package:graphql/client.dart';
import 'package:weather/core/utils/app_urls.dart';

class GraphQLService {
  //Client
  GraphQLClient _client()  {
    final HttpLink httpLink = HttpLink(AppURLs.weatherEndpoint);

    final AuthLink authLink = AuthLink(getToken: () {});
    final policies = Policies(fetch: FetchPolicy.networkOnly);
    final Link link = authLink.concat(httpLink);
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
      defaultPolicies: DefaultPolicies(
        watchQuery: policies,
        query: policies,
        mutate: policies,
      ),
    );
  }

  /// Start query
  Future<QueryResult> query(String queries) async {
    final WatchQueryOptions queryOptions = WatchQueryOptions(
      document: gql(queries),
      pollInterval: const Duration(seconds: 15),
      fetchResults: true,
    );
    return await _client().query(queryOptions);
  }

  /// Start query
  Future<QueryResult> queryVariables(WatchQueryOptions options) async {
    final WatchQueryOptions queryOptions = WatchQueryOptions(
        document: options.document,
        pollInterval: const Duration(seconds: 15),
        fetchResults: true,
        variables: options.variables);
    return await _client().query(queryOptions);
  }

  /// Start mutation
  Future<QueryResult> mutation(String queries) async {
    final MutationOptions queryOptions = MutationOptions(
      document: gql(queries),
    );
    return await _client().mutate(queryOptions);
  }

  Future<QueryResult> mutationVariables(MutationOptions options) async {
    final MutationOptions queryOptions = options;
    return await _client().mutate(queryOptions);
  }

  /// Handle exception
  void handleException(QueryResult queryResult) async {
    log('GraphQL Exception error message log: :${queryResult.exception}');

    if (queryResult.exception!.linkException is HttpLinkServerException) {
      HttpLinkServerException httpLink =
          queryResult.exception!.linkException as HttpLinkServerException;

      if (httpLink.parsedResponse?.errors?.isNotEmpty == true) {
        log("::: GraphQL error message log: ${httpLink.parsedResponse?.errors?.first.message}");
      }
      return;
    }
    if (queryResult.exception!.linkException is NetworkException) {
      return;
    }
  }
}
