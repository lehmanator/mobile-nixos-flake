{ lib
, stdenv
, fetchFromGitLab
, meson
, ninja
}:

stdenv.mkDerivation rec {
  pname = "pbsplash";
  version = "unstable-2023-07-28";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "pbsplash";
    rev = "01af13950c00df631a5ad236d20fb2c8ad4241ea";
    hash = "sha256-iaLh7vrzhQWl5ipVOGsxvvZZX9HE3/fHTzxNUFFcCW8=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    meson
    ninja
  ];

  meta = with lib; {
    description = "";
    homepage = "https://gitlab.com/postmarketOS/pbsplash";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "pbsplash";
    platforms = platforms.all;
  };
}
