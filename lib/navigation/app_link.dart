
class AppLink {
  static const String HomePath = '/home';
  static const String OnboardingPath = '/onboarding';
  static const String LoginPath = '/login';
  static const String ItemPath = '/item';
  static const String ProfilePath = '/profile';

  static const String TabParam = 'tab';
  static const String IdParam = 'id';

  String? location;
  int? currentTab;
  String? itemId;

  AppLink({
    this.location,
    this.currentTab,
    this.itemId
  });

  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    final currentTab = int.tryParse(params[AppLink.TabParam] ?? '');
    final itemId = params[AppLink.IdParam];
    final link = AppLink(
        location: uri.path,
        currentTab: currentTab,
        itemId: itemId
    );
    return link;
  }
  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value
    }) => value == null ? '': '${key}=$value&';

    switch(location) {
      case LoginPath:
        return LoginPath;
      case OnboardingPath:
        return OnboardingPath;
      case ProfilePath:
        return ProfilePath;
      case ItemPath:
        var locatn = '$ItemPath?';
        locatn  += addKeyValPair(
          key: IdParam,
          value: itemId
        );
        return Uri.encodeFull(locatn);
      default:
        var locatn = '$HomePath?';
        locatn += addKeyValPair(
            key: TabParam,
            value: currentTab.toString()
        );
        return Uri.encodeFull(locatn);

    }
  }

}