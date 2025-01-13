# Unauthorized Vehicle Alert

This is a simple Dart application to alert security personnel about unauthorized vehicles at a toll plaza.

## Description

The Unauthorized Vehicle Alert system is an interactive Dart application where vehicles are checked against a list of authorized vehicles. If an unauthorized vehicle is detected, an alert is generated. This system helps in maintaining security at toll plazas by ensuring only authorized vehicles pass through.

## Features

- Checks vehicles against a list of authorized vehicles.
- Generates alerts for unauthorized vehicles.
- Simple and easy-to-understand code.
- Great for beginners to practice Dart basics.

## Requirements

- Dart SDK

## Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/muhammadumerbinfarooq/unauthorized-vehicle-alert.git
    ```

2. **Navigate to the project directory:**
    ```bash
    cd unauthorized-vehicle-alert
    ```

3. **Run the application:**
    ```bash
    dart run alert_system.dart
    ```

## Implementation

The Unauthorized Vehicle Alert system is implemented in a single Dart script (`alert_system.dart`). Here's a brief overview of the main functions:

- `Vehicle`: A class representing a vehicle with a license plate and authorization status.
- `AlertSystem`: A class that checks vehicles and generates alerts.
- `main()`: The main function that initializes the system and tests it with sample vehicles.

## Contributing

Contributions are welcome! If you have any suggestions or improvements, please feel free to submit an issue or a pull request. Here are some ways you can contribute:

- Report bugs and issues.
- Suggest new features or enhancements.
- Improve documentation.
- Submit pull requests with improvements or fixes.

## Acknowledgments

- Inspired by the need for enhanced security at toll plazas.
- Thanks to the Dart community for their support and resources.
- Special thanks to everyone who has contributed to this project.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Example

```plaintext
Alert: Unauthorized vehicle detected! License Plate: LMN456
Vehicle authorized. License Plate: ABC123
