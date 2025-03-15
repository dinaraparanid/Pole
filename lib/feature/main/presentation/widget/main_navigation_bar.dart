import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/main/presentation/bloc/mod.dart';
import 'package:pole/l10n/app_localizations.dart';

final class MainNavigationBar extends StatelessWidget {
  final void Function(Tabs) onTabClick;
  const MainNavigationBar({super.key, required this.onTabClick});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) => platformCall(
        android: MaterialUi,
        iOS: MaterialUi,
        macOS: CupertinoUi,
      )(theme: theme, strings: strings, state: state),
    );
  }

  Widget MaterialUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required MainState state,
  }) => BottomNavigationBar(
    backgroundColor: theme.colors.navigationBar.background,
    selectedItemColor: theme.colors.navigationBar.selected,
    unselectedItemColor: theme.colors.navigationBar.unselected,
    currentIndex: state.selectedTab.index,
    onTap: (index) => onTabClick(Tabs.values[index]),
    items: Items(theme: theme, strings: strings, state: state),
  );

  Widget CupertinoUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required MainState state,
  }) => CupertinoTabBar(
    backgroundColor: theme.colors.navigationBar.background,
    activeColor: theme.colors.navigationBar.selected,
    inactiveColor: theme.colors.navigationBar.unselected,
    currentIndex: state.selectedTab.index,
    onTap: (index) => onTabClick(Tabs.values[index]),
    items: Items(theme: theme, strings: strings, state: state),
  );

  List<BottomNavigationBarItem> Items({
    required AppTheme theme,
    required AppLocalizations strings,
    required MainState state,
  }) => [
    BottomNavigationBarItem(
      label: strings.main_tab_catalog,
      icon: SvgPicture.asset(
        AppImages.loadSvg('ic_catalog').value,
        width: theme.dimensions.size.medium,
        height: theme.dimensions.size.medium,
        colorFilter: ColorFilter.mode(
          state.selectedTab == Tabs.catalog
            ? theme.colors.navigationBar.selected
            : theme.colors.navigationBar.unselected,
          BlendMode.srcIn,
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: strings.main_tab_excursions,
      icon: SvgPicture.asset(
        AppImages.loadSvg(
          state.selectedTab == Tabs.excursions
            ? 'ic_excursions_selected'
            : 'ic_excursions',
        ).value,
        width: theme.dimensions.size.medium,
        height: theme.dimensions.size.medium,
      ),
    ),
    BottomNavigationBarItem(
      label: strings.main_tab_profile,
      icon: SvgPicture.asset(
        AppImages.loadSvg('ic_profile').value,
        width: theme.dimensions.size.medium,
        height: theme.dimensions.size.medium,
        colorFilter: ColorFilter.mode(
          state.selectedTab == Tabs.profile
            ? theme.colors.navigationBar.selected
            : theme.colors.navigationBar.unselected,
          BlendMode.srcIn,
        ),
      ),
    ),
  ];
}