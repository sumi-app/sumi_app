import 'package:auto_route/auto_route.dart';
import 'package:sumi/ui/screens/archive.dart';
import 'package:sumi/ui/screens/bloggers.dart';
import 'package:sumi/ui/screens/press_tour.dart';
import 'package:sumi/ui/screens/press_tours.dart';
import 'package:sumi/ui/widgets/super_structures/super_structures.dart';
// import 'package:poema/ui/screens/author/authors.dart';
// import 'package:poema/ui/screens/author/author.dart';
// import 'package:poema/ui/screens/favorites.dart';
// import 'package:poema/ui/screens/home.dart';
// import 'package:poema/ui/screens/poema.dart';
// import 'package:poema/ui/screens/search.dart';
// import 'package:poema/ui/screens/themes.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: '',
  routes: <AutoRoute>[
    // AutoRoute(page: HomeNavigator, initial: true),
    AutoRoute(page: Home, initial: true),
    AutoRoute(page: PressToursScreen),
    AutoRoute(page: PressTourScreen),
    AutoRoute(page: BloggersScreen),
    AutoRoute(page: ArchiveScreen),
  ],
)
class $AppRouter {}
