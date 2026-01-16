{
  description = "My selection of flake templates";

  outputs = { self, ... }: {
    templates = {
      go-zsh = {
        path = ./templates/go;
        description = "A simple dev shell with go";
      };
    };
    defaultTemplate = self.templates.go-zsh;
  };
}
    
