{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "mobile-config-firefox";
  version = "4.3.1";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "mobile-config-firefox";
    rev = version;
    hash = "sha256-KnJ1JTLvEt+TyEFM/OWM1MmUE6NDi4NMQEutkQzof+g=";
  };

  meta = with lib; {
    description = "Mobile and privacy friendly configuration for Firefox (distro-independent";
    homepage = "https://gitlab.com/postmarketOS/mobile-config-firefox";
    license = licenses.mpl20;
    maintainers = with maintainers; [ ];
    mainProgram = "mobile-config-firefox";
    platforms = platforms.all;
  };
}
