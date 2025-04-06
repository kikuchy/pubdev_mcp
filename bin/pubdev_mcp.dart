import 'package:mcp_dart/mcp_dart.dart';
import 'package:pub_api_client/pub_api_client.dart';

void main() async {
  McpServer server = McpServer(
    Implementation(name: "pubdev-mcp", version: "1.0.0"),
    options: ServerOptions(
      capabilities: ServerCapabilities(
        resources: ServerCapabilitiesResources(),
        tools: ServerCapabilitiesTools(),
      ),
    ),
  );

  server.tool(
    "search pub.dev",
    description: 'Search for packages on pub.dev',
    inputSchemaProperties: {
      'query': {'type': 'string'},
    },
    callback: ({args, extra}) async {
      final client = PubClient();
      final results = await client.search(
        args!['query'],
      );
      final packages = results.packages.map((e) => e.package);
      final packageDetails = await Future.wait(
        packages.map(
          (package) async {
            final (info, metrics) = await (
              client.packageInfo(package),
              client.packageMetrics(package),
            ).wait;
            return {
              'name': info.name,
              'version': info.version,
              'description': info.description,
              'url': info.url,
              'score': metrics?.score,
            };
          },
        ),
      );

      return CallToolResult(
        content: [
          TextContent(text: 'Results: ${packageDetails.length}'),
          ...packageDetails.map((e) => TextContent(
              text:
                  '${e['name']}(${e['version']}): ${e['description']} ${e['url']} ${e['score']}')),
        ],
      );
    },
  );

  server.connect(StdioServerTransport());
}
