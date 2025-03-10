import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateLogger extends ProviderObserver {
  const StateLogger();

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    super.didUpdateProvider(provider, previousValue, newValue, container);

    // Log the update with a proper logger
    debugPrint('''
Provider Update:
  Provider: ${provider.runtimeType}
  Previous Value: $previousValue
  New Value: $newValue
  Container: $container
''');
  }
}
