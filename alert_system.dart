class Vehicle {
  final String licensePlate;
  final bool isAuthorized;

  Vehicle(this.licensePlate, this.isAuthorized);
}

class AlertSystem {
  final List<Vehicle> authorizedVehicles;

  AlertSystem(this.authorizedVehicles);

  void checkVehicle(Vehicle vehicle) {
    if (!vehicle.isAuthorized) {
      print('Alert: Unauthorized vehicle detected! License Plate: ${vehicle.licensePlate}');
    } else {
      print('Vehicle authorized. License Plate: ${vehicle.licensePlate}');
    }
  }
}

void main() {
  // List of authorized vehicles
  List<Vehicle> authorizedVehicles = [
    Vehicle('ABC123', true),
    Vehicle('XYZ789', true),
  ];

  // Initialize the alert system
  AlertSystem alertSystem = AlertSystem(authorizedVehicles);

  // Test with some vehicles
  Vehicle vehicle1 = Vehicle('ABC123', true);
  Vehicle vehicle2 = Vehicle('LMN456', false);

  alertSystem.checkVehicle(vehicle1); // Should print: Vehicle authorized.
  alertSystem.checkVehicle(vehicle2); // Should print: Alert: Unauthorized vehicle detected!
}
