{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "postmarketos-charging-sdl";
  version = "0.1";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "charging-sdl";
    rev = version;
    hash = "sha256-oinMYRlCiJ8mrO0sORxpiknJ9JwePqnqkDjKepNMrJw=";
  };

  meta = with lib; {
    description = "SDL2 charging application for the initramfs";
    homepage = "https://gitlab.com/postmarketOS/charging-sdl";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "postmarketos-charging-sdl";
    platforms = platforms.all;
  };
}
