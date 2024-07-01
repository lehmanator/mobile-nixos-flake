{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "postmarketos-msm-firmware-loader";
  version = "1.5.0";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "msm-firmware-loader";
    rev = version;
    hash = "sha256-E00O57s3i16h9Powp1hgKpGw1FnmUjCiYV4TIUWdlIQ=";
  };

  meta = with lib; {
    description = "Automatically load firmware from device partitions";
    homepage = "https://gitlab.com/postmarketOS/msm-firmware-loader";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "postmarketos-msm-firmware-loader";
    platforms = platforms.all;
  };
}
