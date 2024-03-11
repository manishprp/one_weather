import 'package:flutter_bloc/flutter_bloc.dart';
import 'city_name_from_coords_bloc.dart';
import 'current_page_bloc.dart';
import 'citites_bloc.dart';
import 'coordinates_bloc.dart';
import 'current_index_bloc.dart';
import 'multi_weather_bloc.dart';
import 'weather_bloc.dart';

import 'internet_bloc.dart';
import 'location_bloc.dart';

blocInstances() => [
      BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc(),
      ),
      BlocProvider<LocationBloc>(
        create: (context) => LocationBloc(),
      ),
      BlocProvider<InternetBloc>(
        create: (context) => InternetBloc(),
      ),
      BlocProvider<CoordinatesBloc>(
        create: (context) => CoordinatesBloc(),
      ),
      BlocProvider<CititesBloc>(
        create: (context) => CititesBloc(),
      ),
      BlocProvider<MultiWeatherBloc>(
        create: (context) => MultiWeatherBloc(),
      ),
      BlocProvider<CurrentIndexBloc>(
        create: (context) => CurrentIndexBloc(),
      ),
      BlocProvider<CurrentPageBloc>(
        create: (context) => CurrentPageBloc(),
      ),
      BlocProvider<CityNameFromCoordsBloc>(
        create: (context) => CityNameFromCoordsBloc(),
      ),
    ];
