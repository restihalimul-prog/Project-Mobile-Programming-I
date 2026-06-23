import '../models/destination_model.dart';
import '../services/destination_service.dart';

class DestinationController {
  final DestinationService service = DestinationService();

  Future<void> tambahData(DestinationModel data) async {
    await service.createDestination(data);
  }
}
