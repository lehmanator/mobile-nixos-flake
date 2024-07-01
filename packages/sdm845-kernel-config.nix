{ lib
, fetchgit
, stdenv
, ...
}:
stdenv.mkDerivation {
  pname = "sdm845-kernel-config";
  version = "6.9.0";
  src = fetchgit {
    url = "https://gitlab.com/postmarketOS/pmaports";
    rev = "9026187fe1248c3524042be73eb2d02970742a97";
    hash = "sha256-FBIdx5bA7P5pOy5s73kSmspb4zuhpfpD63Bftde5f3M=";
    sparseCheckout = [ "device/community/linux-postmarketos-qcom-sdm845" ];
  };
  buildPhase = ''
    cp $src/device/community/linux-postmarketos-qcom-sdm845/config-postmarketos-qcom-sdm845.aarch64 $out
  '';
}
