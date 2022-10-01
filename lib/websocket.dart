import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
final String AUTH_WMID = "104202";
final String AUTH_USERNAME = "TradeGrub01";
final String AUTH_PASSWORD = "Trade2021";

class QuoteMediaWebSocket {
  static WebSocketChannel channel = WebSocketChannel.connect(
      Uri.parse("wss://app.quotemedia.com/cache/stream/v1"));

  void processResponse(String event)
  {
    print(json.decode(event));
  }
  void func() {
    Map<String, dynamic> request = {
      "action": "authenticate",
      "data": {"key_id": AUTH_USERNAME, "secret_key": AUTH_PASSWORD}
    };
    channel.sink.add(json.encode(request));
    Stream streamer = channel.stream.asBroadcastStream().map((event) => processResponse(event));
   // print("done");

  }
}


