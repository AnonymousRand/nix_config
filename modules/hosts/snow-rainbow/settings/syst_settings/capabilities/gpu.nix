import ../../../_cfg_all_systs_for_host.nix {
  systSettings.capabilities.gpu = {
    supported = true;
    vendor = "nvidia";
  };
}
