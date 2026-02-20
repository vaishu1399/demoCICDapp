/// Abstract class to check network connectivity.
/// This will be implemented based on the platform.
abstract class NetworkInfo {
  /// Returns true if the device is connected to the internet.
  Future<bool> get isConnected;
}
