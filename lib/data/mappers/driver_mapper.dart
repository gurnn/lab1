
import '../dtos/driver_dto.dart';
import '../../models/card_data.dart';


extension DriverMapper on DriverDto {
  CardData toDomain() {
    String carImage;

    if (carModel.toLowerCase().contains('w204')) {
      carImage = 'assets/images/car1.jpg';
    } else if (carModel.toLowerCase().contains('f10')) {
      carImage = 'assets/images/car2.jpg';
    } else if (carModel.toLowerCase().contains('f20')) {
      carImage = 'assets/images/car3.jpg';
    } else {
      carImage = 'assets/images/car1.jpg';
    }

    return CardData(
      title: carModel,
      description: '$fullName\nКатегория прав: $licenseCategory',
      image: carImage,
      details: 'Водитель: $fullName\n'
          'Телефон: $phone\n'
          'Категория прав: $licenseCategory\n'
          'Автомобиль: $carModel\n'
          'Госномер: $carNumber',
    );
  }
}
