// import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
// import 'package:serverpod_flutter/serverpod_flutter.dart';
// import 'package:track_ease_client/track_ease_client.dart';

// class BackendService {
//   final Client _client;
//   final SessionManager _sessionManager;

//   static BackendService? _instance;

//   BackendService._({
//     required Client client,
//     required SessionManager sessionManager,
//   })  : _client = client,
//         _sessionManager = sessionManager;

//   static BackendService get instance {
//     if (_instance != null) _instance;

//     final client = Client(
//       'https://letsmakebets.onrender.com/',
//       // 'http://$localhost:8080/',
//       authenticationKeyManager: FlutterAuthenticationKeyManager(),
//     )..connectivityMonitor = FlutterConnectivityMonitor();

//     return _instance ??= BackendService._(
//       client: client,
//       sessionManager: SessionManager(
//         caller: client.modules.auth,
//       ),
//     );
//   }

//   Client get client => _client;
//   SessionManager get sessionManager => _sessionManager;
// }
