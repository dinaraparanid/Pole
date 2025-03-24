import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/adaptive_page_route.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/funtions/distinct_state.dart';
import 'package:pole/feature/excursions/presentation/excursions_screen.dart';
import 'package:pole/feature/main/presentation/bloc/mod.dart';
import 'package:pole/feature/main/presentation/widget/main_navigation_bar.dart';

final _mainNavigatorKey = GlobalKey<NavigatorState>();

final class MainScreen extends StatelessWidget {
  final MainBloc bloc;
  const MainScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => bloc,
      child: BlocConsumer<MainBloc, MainState>(
        listenWhen: distinctState((x) => x.selectedTab),
        listener: (context, state) {
          final router = _mainNavigatorKey.currentState;

          switch (state.selectedTab) {
            case Tabs.catalog: router?.pushReplacementNamed(Tabs.catalog.name);
            case Tabs.excursions: router?.pushReplacementNamed(Tabs.excursions.name);
            case Tabs.profile: router?.pushReplacementNamed(Tabs.profile.name);
          }
        },
        builder: (context, state) => Scaffold(
          extendBody: true,
          backgroundColor: theme.colors.background,
          body: MainNavigator(),
          bottomNavigationBar: MainNavigationBar(
            onTabClick: (tab) => bloc.add(TabClicked(tab: tab)),
          ),
        ),
      ),
    );
  }

  Widget MainNavigator() => SafeArea(
    child: Navigator(
      key: _mainNavigatorKey,
      initialRoute: Tabs.excursions.name,
      onGenerateRoute: (settings) {
        if (settings.name == Tabs.catalog.name) {
          return AdaptivePageRoute((_) => Text('TODO: Catalog UI'));
        }

        if (settings.name == Tabs.excursions.name) {
          return AdaptivePageRoute((_) => ExcursionsScreen(bloc: bloc.createExcursionsBloc()));
        }

        if (settings.name == Tabs.profile.name) {
          return AdaptivePageRoute((_) => Text('TODO: Profile UI'));
        }

        return null;
      },
    ),
  );
}
