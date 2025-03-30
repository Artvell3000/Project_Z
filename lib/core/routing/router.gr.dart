// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [BasketScreen]
class BasketRoute extends PageRouteInfo<void> {
  const BasketRoute({List<PageRouteInfo>? children})
      : super(
          BasketRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BasketScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [ProductScreen]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    Key? key,
    required int productId,
    List<PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>();
      return ProductScreen(
        key: args.key,
        productId: args.productId,
      );
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.productId,
  });

  final Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [ProjectZShellScreen]
class ProjectZShellRoute extends PageRouteInfo<void> {
  const ProjectZShellRoute({List<PageRouteInfo>? children})
      : super(
          ProjectZShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectZShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProjectZShellScreen();
    },
  );
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    SearchFilter? initFilter,
    bool startWithBottomSheet = false,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            initFilter: initFilter,
            startWithBottomSheet: startWithBottomSheet,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SearchRouteArgs>(orElse: () => const SearchRouteArgs());
      return SearchScreen(
        key: args.key,
        initFilter: args.initFilter,
        startWithBottomSheet: args.startWithBottomSheet,
      );
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.initFilter,
    this.startWithBottomSheet = false,
  });

  final Key? key;

  final SearchFilter? initFilter;

  final bool startWithBottomSheet;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, initFilter: $initFilter, startWithBottomSheet: $startWithBottomSheet}';
  }
}

/// generated route for
/// [ZEmptyShellScreen]
class ZEmptyShellRoute extends PageRouteInfo<void> {
  const ZEmptyShellRoute({List<PageRouteInfo>? children})
      : super(
          ZEmptyShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'ZEmptyShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ZEmptyShellScreen();
    },
  );
}
