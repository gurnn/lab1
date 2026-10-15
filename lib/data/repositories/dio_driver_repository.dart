
import 'package:dio/dio.dart';

import '../dtos/driver_dto.dart';
import 'driver_repository.dart';

class DioDriverRepository implements DriverRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8080',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  @override
  Future<List<DriverDto>> loadDrivers({String search = ''}) async {
    final response = await _dio.get<List<dynamic>>(
      '/api/1.0/drivers',
      queryParameters: {
        if (search.trim().isNotEmpty) 'search': search.trim(),
      },
    );

    final data = response.data ?? [];

    return data
        .map(
          (json) => DriverDto.fromJson(
        Map<String, dynamic>.from(json as Map),
      ),
    )
        .toList();
  }
}
