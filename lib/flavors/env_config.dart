import 'package:logger/logger.dart';
import 'package:shater/util/constant.dart';


class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool shouldCollectCrashLog;

  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    this.shouldCollectCrashLog = false,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
          methodCount: APPCONSTANT.loggerMethodCount,
          // number of method calls to be displayed
          errorMethodCount: APPCONSTANT.loggerErrorMethodCount,
          // number of method calls if stacktrace is provided
          lineLength: APPCONSTANT.loggerLineLength,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }
}
