import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory wf = WeatherFactory(dotenv.env['WEATHER_KEY'] ?? '',
            language: Language.ENGLISH);

        // get current weather
        Weather currentWeather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);

        // get 5 day forecast with 3 hour step
        List<Weather> forecast = await wf.fiveDayForecastByLocation(
            event.position.latitude, event.position.longitude);

        // get today's hourly forecast (every 4 hour)
        List<Weather> hourlyForecast = forecast
            .where((weather) => weather.date!.day == DateTime.now().day)
            .toList();

        // get daily forecast for next 7 days
        List<Weather> dailyForecast = [];
        DateTime today = DateTime.now();

        for (int i = 1; i <= 7; i++) {
          DateTime date = today.add(Duration(days: i));
          Weather dayWeather = forecast.firstWhere(
              (weather) => weather.date!.day == date.day,
              orElse: () => forecast.first);
          dailyForecast.add(dayWeather);
        }

        emit(WeatherBlocSuccess(weather: currentWeather, hourlyForecast: hourlyForecast, dailyForecast: dailyForecast));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
