{ lib
, stdenv
, fetchFromGitLab
, meson
, ninja
}:

stdenv.mkDerivation rec {
  pname = "postmarketos-osk-sdl";
  version = "0.66";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "osk-sdl";
    rev = version;
    hash = "sha256-gCh0qrvVxcA6JsFy4JgLhg4vVXO1pEJaROjP+PQXw0A=";
  };

  nativeBuildInputs = [
    meson
    ninja
  ];

  meta = with lib; {
    description = "SDL2 On-screen Keyboard";
    homepage = "https://gitlab.com/postmarketOS/osk-sdl";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "postmarketos-osk-sdl";
    platforms = platforms.all;
  };
}
