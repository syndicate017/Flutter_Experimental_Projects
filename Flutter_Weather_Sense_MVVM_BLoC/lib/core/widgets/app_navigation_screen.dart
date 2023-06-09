import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_weather_sense_mvvm_bloc/config/dependency_injections/dependency_injection.dart';
import 'package:flutter_weather_sense_mvvm_bloc/core/core_barrel.dart';
import 'package:flutter_weather_sense_mvvm_bloc/features/daily_weather_forecast/views/daily_weather_forecast_screen.dart';
import 'package:flutter_weather_sense_mvvm_bloc/features/home/views/home_screen.dart';

class AppNavigationScreen extends HookWidget {
  const AppNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndexState = useState<int>(0);

    return ScaffoldWithNavigationBar(
      navigationBarItems: _buildNavigationBarItems(
        index: currentIndexState.value,
      ),
      currentIndex: currentIndexState.value,
      onItemPressed: (index) {
        currentIndexState.value = index;
        debugPrint("onItemPressed at index -> ${currentIndexState.value}");
      },
      child: SafeArea(
        child: _buildNavigationScreens().elementAt(currentIndexState.value),
      ),
    );
  }

  /// Initialize [BottomNavigationBarItem] into [ScaffoldWithNavigationBar].
  /// It requires minimum item for at least two [BottomNavigationBarItem]
  /// to be able to interchange each other.
  List<BottomNavigationBarItem> _buildNavigationBarItems({
    required int index,
  }) {
    final navigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: "Home",
        icon: index == 0
            ? Icon(
                Icons.home_rounded,
                color: $styles.colors.secondary,
              )
            : Icon(
                Icons.home_outlined,
                color: $styles.colors.secondary,
              ),
      ),
      BottomNavigationBarItem(
        label: "Daily Weather Forecast",
        icon: index == 1
            ? Icon(
                Icons.calendar_month_rounded,
                color: $styles.colors.secondary,
              )
            : Icon(
                Icons.calendar_month_outlined,
                color: $styles.colors.secondary,
              ),
      )
    ];
    return navigationBarItems;
  }

  /// Initialize [Widget] to be displayed on top of [ScaffoldWithNavigationBar].
  /// It requires minimum item for at least two [Widget]
  /// to be able to interchange each other.
  List<Widget> _buildNavigationScreens() {
    const screens = <Widget>[
      FadeInWrapper(
        key: ValueKey<String>("FIRST_FADE_IN_KEY"),
        child: HomeScreen(),
      ),
      FadeInWrapper(
        key: ValueKey<String>("SECOND_FADE_IN_KEY"),
        child: DailyWeatherForecastScreen(),
      ),
    ];

    return screens;
  }
}
