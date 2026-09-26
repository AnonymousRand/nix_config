import ../../../_cfg_all_systs_for_host.nix {
  settings.capabilities.gpu = {
    supported = true;
    vendor = "nvidia";
  };
}
