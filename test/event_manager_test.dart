import 'package:shelf/shelf.dart';
import 'package:test/test.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main() {
  test('should print url for connection to server', () async {
    Response _echoRequest(Request req) => Response.ok('Request for ${req.url}');

    Handler handler =
        const Pipeline().addMiddleware(logRequests()).addHandler(_echoRequest);

    var server = await shelf_io.serve(handler, 'localhost', 8080);
    expect(server.address.host, 'http://localhost:8080');
    
  });
}
