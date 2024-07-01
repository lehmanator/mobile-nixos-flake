{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "postmarketos-q6voiced";
  version = "unstable-2022-07-08";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "q6voiced";
    rev = "736138bfc9f7b455a96679e2d67fd922a8f16464";
    hash = "sha256-7k5saedIALHlsFHalStqzKrqAyFKx0ZN9FhLTdxAmf4=";
  };

  meta = with lib; {
    description = "";
    homepage = "https://gitlab.com/postmarketOS/q6voiced";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "postmarketos-q6voiced";
    platforms = platforms.all;
  };
}
