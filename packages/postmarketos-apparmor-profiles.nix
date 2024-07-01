{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "postmarketos-apparmor-profiles";
  version = "0.2.0";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "postmarketos-apparmor-profiles";
    rev = version;
    hash = "sha256-fbzr89/EH23cXb5uZQ7tH5+fKlBMH1fFteLEE77gbdY=";
  };

  meta = with lib; {
    description = "Experimental, not being used yet) postmarketOS specific AppArmor profiles";
    homepage = "https://gitlab.com/postmarketOS/postmarketos-apparmor-profiles";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ ];
    mainProgram = "postmarketos-apparmor-profiles";
    platforms = platforms.all;
  };
}
