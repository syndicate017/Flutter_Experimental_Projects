import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_sense_mvvm_bloc/config/config_barrel.dart';
import 'package:flutter_weather_sense_mvvm_bloc/core/core_barrel.dart';

class HomeCurrentWeatherForecastCard extends StatelessWidget {
  /// Function will triggered when the [HomeCurrentWeatherForecastCard]
  /// was pressed.
  final void Function()? onTap;

  /// Describe the weather temperature in Celsius degree.
  final String? temperatureInCelsius;

  /// Show the current weather condition using image.
  final String? weatherImage;

  /// Describe the humidity unit in percentage
  /// based on the current weather status.
  final String? humidity;

  /// Describe the precipitation unit in millimeter
  /// based on the current weather status.
  final String? precipitation;

  /// Describe the precipitation unit in hectopascal (hPa)
  /// based on the current weather status.
  final String? pressure;

  /// Describe the wind speed unit in metres per second (m/s)
  /// based on the current weather status.
  final String? windSpeed;

  const HomeCurrentWeatherForecastCard({
    super.key,
    this.onTap,
    this.temperatureInCelsius,
    this.weatherImage,
    this.humidity,
    this.precipitation,
    this.pressure,
    this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: $styles.insets.sm,
        right: $styles.insets.sm,
      ),
      child: Container(
        width: context.widthPx,
        height: context.heightPct(0.25),
        decoration: BoxDecoration(
          color: $styles.colors.tertiary,
          borderRadius: BorderRadius.circular($styles.corners.xs),
          boxShadow: kElevationToShadow[3],
        ),
        child: Material(
          color: $styles.colors.tertiary,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.circular($styles.corners.xs),
          type: MaterialType.card,
          child: InkWell(
            onTap: onTap ?? () {},
            child: Padding(
              padding: EdgeInsets.all($styles.insets.xs),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: context.widthPx * 0.55,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.share_location_rounded),
                                Gap($styles.insets.xs),
                                Expanded(
                                  child: AppAutoResizeText(
                                    alignment: Alignment.centerLeft,
                                    text: "Current location",
                                    textAlign: TextAlign.left,
                                    textStyle: $styles.textStyle.body5Bold,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Gap($styles.insets.sm),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap($styles.insets.lg),
                                AppAutoResizeText(
                                  width: context.widthPx * 0.3,
                                  height: context.heightPx * 0.06,
                                  alignment: Alignment.center,
                                  text: "${temperatureInCelsius ?? 0} °C",
                                  textStyle: $styles.textStyle.h1,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: context.widthPx,
                          height: context.heightPx * 0.1,
                          margin: EdgeInsets.only(right: $styles.insets.xl),
                          child: SvgPicture.asset(
                            weatherImage ?? "",
                            width: context.widthPx,
                            height: context.heightPx,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    indent: 5,
                    endIndent: 5,
                    color: $styles.colors.primary,
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            AppAutoResizeText(
                              text: "Humidity",
                              textStyle: $styles.textStyle.body5,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                            AppAutoResizeText(
                              text: "${humidity ?? 0} %",
                              textStyle: $styles.textStyle.body5Bold,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            AppAutoResizeText(
                              text: "Precipitation",
                              textStyle: $styles.textStyle.body5,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                            AppAutoResizeText(
                              text: "${precipitation ?? 0} %",
                              textStyle: $styles.textStyle.body5Bold,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            AppAutoResizeText(
                              text: "Pressure",
                              textStyle: $styles.textStyle.body5,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                            AppAutoResizeText(
                              text: "${pressure ?? 0} hPa",
                              textStyle: $styles.textStyle.body5Bold,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            AppAutoResizeText(
                              text: "Wind",
                              textStyle: $styles.textStyle.body5,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                            AppAutoResizeText(
                              text: "${windSpeed ?? 0} km/h",
                              textStyle: $styles.textStyle.body5Bold,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
