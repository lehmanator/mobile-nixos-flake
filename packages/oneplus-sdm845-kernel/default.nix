{
  mobile-nixos,
  fetchFromGitLab,
  fetchpatch,
  lib,
  ...
}:
mobile-nixos.kernel-builder rec {
  version = "6.9.0";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    hash = "sha256-7QRhleNmvE+1XqwwzOpAb31n9NIwVSVnLoTNZw0Yj40=";
    rev = "sdm845-${version}";
  };

  patches = [
    # ASoC: codecs: tas2559: Fix build
    (fetchpatch {
      url = "https://github.com/samueldr/linux/commit/d1b59edd94153ac153043fb038ccc4e6c1384009.patch";
      sha256 = "sha256-zu1m+WNHPoXv3VnbW16R9SwKQzMYnwYEUdp35kUSKoE=";
    })

    # Fix camera
    (fetchpatch {
      url = "https://gitlab.com/sdm845-mainline/linux/-/commit/3a05e25d05887d1784a0b954e81e3290021e0d6d.patch";
      hash = lib.fakeHash;
    })
    ./0001-arm64-dts-qcom-sdm845-xiaomi-polaris-Enable-ath10k-h.patch
    ./0002-drm-panel-Enable-prepare_prev_first-flag-for-NT35596.patch
  ];

  isModular = false;
  isCompressed = "gz";
}
