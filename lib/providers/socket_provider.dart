import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketProvider with ChangeNotifier {

  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;

  SocketProvider() {
    initConfig();
  }

  void initConfig() {
    
    _socket = IO.io('http://192.168.1.9:3000',
      IO.OptionBuilder()
       .setTransports(['websocket']).build());

    _socket.onConnect((_) {
     _serverStatus = ServerStatus.Online;
     notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    // _socket.on('nuevo-mensaje', (payload){
    //   print('nuevo-mensaje: $payload');
    // });
  }
} 
