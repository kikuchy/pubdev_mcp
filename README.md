# PubDev MCP

This MCP provides functionality for searching pub.dev packages using natural language queries and performing basic arithmetic calculations. Powered by LLM integration, it enables intuitive package discovery through conversational interactions.

## Features

- Natural language package search on pub.dev
  - Use conversational queries to find packages
  - Get intelligent package recommendations based on your needs
  - Powered by LLM for better understanding of search intent

## Installation

1. Clone this repository
```bash
git clone [repository-url]
```

2. Install dependencies
```bash
dart pub get
```

3. Configure mcp.json
Add the following configuration to your `~/.cursor/mcp.json`:
```json
{
  "mcpServers": {
    "PubDev MCP": {
      "command": "dart [path-to-repo]/bin/pubdev_mcp.dart",
      "workingDirectory": "[path-to-repo]"
    }
  }
}
```
Replace `[path-to-repo]` with the actual path to your cloned repository.


## Requirements

- Dart SDK
- Flutter (recommended)

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Create a Pull Request
