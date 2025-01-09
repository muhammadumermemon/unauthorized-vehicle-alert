import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';

// Vehicle class representing a vehicle with a license plate and authorization status
class Vehicle {
  final String licensePlate;
  final bool isAuthorized;

  Vehicle(this.licensePlate, this.isAuthorized);
}

// AlertSystem class to manage authorized vehicles and check for unauthorized access
class AlertSystem {
  final List<Vehicle> authorizedVehicles;
  final List<Vehicle> detectedVehicles = [];
  final StreamController<String> _alertStreamController = StreamController<String>();

  AlertSystem(this.authorizedVehicles) {
    // Listen for alerts and handle them
    _alertStreamController.stream.listen((alert) {
      print(alert);
      // Here you could add additional logging or alerting mechanisms
    });
  }

  // Method to check if a vehicle is authorized
  void checkVehicle(Vehicle vehicle) {
    detectedVehicles.add(vehicle);
    if (!vehicle.isAuthorized) {
      _alertStreamController.add('Alert: Unauthorized vehicle detected! License Plate: ${vehicle.licensePlate}');
    } else {
      _alertStreamController.add('Vehicle authorized. License Plate: ${vehicle.licensePlate}');
    }
  }

  // Method to simulate vehicle detection in a separate thread
  Future<void> simulateVehicleDetection() async {
    // Simulate vehicle detection every 2 seconds
    while (true) {
      await Future.delayed(Duration(seconds: 2));
      // Randomly generate a vehicle for testing
      String randomPlate = _generateRandomLicensePlate();
      bool isAuthorized = Random().nextBool(); // Randomly decide if the vehicle is authorized
      checkVehicle(Vehicle(randomPlate, isAuthorized));
    }
  }

  // Method to generate a random license plate
  String _generateRandomLicensePlate() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(6, (index) => chars[Random().nextInt(chars.length)]).join();
  }

  // Method to shut down the alert system gracefully
  void shutdown() {
    _alertStreamController.close();
  }
}

// Encryption utility class for securing sensitive data
class EncryptionUtil {
  // Method to encrypt a string using SHA-256
  static String encrypt(String data) {
    var bytes = utf8.encode(data);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}

// Main function to run the alert system
void main() async {
  // List of authorized vehicles
  List<Vehicle> authorizedVehicles = [
    Vehicle('ABC123', true),
    Vehicle('XYZ789', true),
  ];

  // Initialize the alert system
  AlertSystem alertSystem = AlertSystem(authorizedVehicles);

  // Start vehicle detection simulation in a separate isolate
  await alertSystem.simulateVehicleDetection();

  // For demonstration purposes, we will run the simulation for 10 seconds
  await Future.delayed(Duration(seconds: 10));
  alertSystem.shutdown();
}
