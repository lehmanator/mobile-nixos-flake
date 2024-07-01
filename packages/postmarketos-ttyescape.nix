{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "ttyescape";
  version = "1.0.2";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "ttyescape";
    rev = version;
    hash = "sha256-5FQR5OBKal+yu/BZVTt7+p6yg0R+5LaYMT37T1NRpH8=";
  };

  meta = with lib; {
    description = "A collection of tools for allowing mobile users to switch to a TTY";
    homepage = "https://gitlab.com/postmarketOS/ttyescape";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ ];
    mainProgram = "ttyescape";
    platforms = platforms.all;
  };
}
