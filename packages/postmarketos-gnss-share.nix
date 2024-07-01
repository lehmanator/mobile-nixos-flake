{ lib
, buildGoModule
, fetchFromGitLab
}:

buildGoModule rec {
  pname = "gnss-share";
  version = "0.8.1";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "gnss-share";
    rev = version;
    hash = "sha256-4X1oiQWn2oZPw/14hNyZ0a6FEwoykotBisY6lk6lj2k=";
  };

  vendorHash = "sha256-dmE6hfKUqEr7BMNi/HMUOk4jDB0dPXEMkWQyWj6XpY4=";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "";
    homepage = "https://gitlab.com/postmarketOS/gnss-share";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "gnss-share";
  };
}
