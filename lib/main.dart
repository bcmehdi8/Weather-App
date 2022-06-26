import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStore.open(path: await _localPath);

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
