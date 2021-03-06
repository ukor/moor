import 'package:sqlparser/sqlparser.dart';

class EngineOptions {
  /// Moor extends the sql grammar a bit to support type converters and other
  /// features. Enabling this flag will make this engine parse sql with these
  /// extensions enabled.
  final bool useMoorExtensions;

  /// Enables functions declared in the `json1` module for analysis
  final bool enableJson1;

  /// Enables the new, experimental type inference.
  final bool enableExperimentalTypeInference;

  /// All [Extension]s that have been enabled in this sql engine.
  final List<Extension> enabledExtensions;

  final List<FunctionHandler> _addedFunctionHandlers = [];
  final Map<String, FunctionHandler> addedFunctions = {};

  EngineOptions({
    this.useMoorExtensions = false,
    this.enableJson1 = false,
    this.enabledExtensions = const [],
    this.enableExperimentalTypeInference = false,
  });

  void addFunctionHandler(FunctionHandler handler) {
    _addedFunctionHandlers.add(handler);

    for (final function in handler.functionNames) {
      addedFunctions[function.toLowerCase()] = handler;
    }
  }
}
