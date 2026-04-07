{ ... }:

{
  programs.claude-code = {
    enable = true;
    mcpServers = {
      context7 = {
        type = "http";
        url = "https://mcp.context7.com/mcp";
        headers = {
          "CONTEXT7_API_KEY" = "ctx7sk-01b79f30-9769-4ec3-8d75-14fe4b6966f2";
        };
      };
      serena = {
        command = "uvx";
        args = [
          "--from"
          "git+https://github.com/oraios/serena"
          "serena"
          "start-mcp-server"
          "--context"
          "ide-assistant"
          "--project"
          "$PWD"
        ];
      };
      github = {
        type = "http";
        url = "https://api.githubcopilot.com/mcp/";
      };
      playwright = {
        type = "stdio";
        command = "npx";
        args = [
          "-y"
          "@playwright/mcp@latest"
        ];
        env = { };
      };
    };
    # hooks = {
    #   PreToolUse = [
    #     {
    #       matcher = "Read|Edit|Write";
    #       hooks = [{
    #         type = "command";
    #         command = "python3 ~/.claude/hooks/block-secrets.py";
    #       }];
    #     }
    #   ];
    # };
  };
}
