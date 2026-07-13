{ self, ... }: {
  flake.nixosModules.basePackages = { ... }: {
    imports = [
      self.nixosModules.efibootmgr
      self.nixosModules.git
      self.nixosModules.tree
      self.nixosModules.vim
      self.nixosModules.wget
    ];
  };
}
