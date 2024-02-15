enum BuildFlavor { production, development }

BuildEnvironment? _env;
BuildEnvironment? get env => _env;

class BuildEnvironment {
  /// The backend server.
  final String? baseUrl;
  final BuildFlavor? flavor;
  static String? baseUrlUse;

  BuildEnvironment._init({this.flavor, this.baseUrl});

  static void init({required flavor, required baseUrl}) {
    _setUrl(flavor);
    _env ??= BuildEnvironment._init(flavor: flavor, baseUrl: baseUrl);
  }

  static _setUrl(BuildFlavor flavor) {
    switch (flavor) {
      case BuildFlavor.development:
        baseUrlUse = 'https://test.shattir.com';
        break;
      case BuildFlavor.production:
        baseUrlUse = 'https://shattir.com';
        break;
    }
  }
}
