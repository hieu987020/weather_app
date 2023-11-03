import 'package:flutter/material.dart';

/// Main Weather Widget
class MainWeather extends StatelessWidget {
  const MainWeather({
    super.key,
    this.locationName,
    this.temperature,
    this.time,
  });

  final String? locationName;
  final String? temperature;
  final String? time;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const SizedBox(height: 50),
          // city name text
          Text(
            locationName ?? "nun",
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          // temperature in celsius text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  temperature ?? "nun",
                  style: const TextStyle(
                    fontSize: 96,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          // weather condition text
          Text(
            time ?? "nun",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
