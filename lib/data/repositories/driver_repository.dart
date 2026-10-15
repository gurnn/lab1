
import '../dtos/driver_dto.dart';

abstract class DriverRepository {
  Future<List<DriverDto>> loadDrivers({String search = ''});
}
