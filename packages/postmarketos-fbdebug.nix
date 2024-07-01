{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "postmarketos-fbdebug";
  version = "1.0.0";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "fbdebug";
    rev = version;
    hash = "sha256-+/9yh8al6IdLdCBkOgOfaQRPZiqZ9CIbHJu52wZsGfM=";
  };

  meta = with lib; {
    description = "Framebuffer debugging tool";
    homepage = "https://gitlab.com/postmarketOS/fbdebug";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "postmarketos-fbdebug";
    platforms = platforms.all;
  };
}
