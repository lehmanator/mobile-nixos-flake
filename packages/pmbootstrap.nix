{ lib
, python3
, fetchFromGitLab
}:

python3.pkgs.buildPythonApplication rec {
  pname = "pmbootstrap";
  version = "2.2.1";
  pyproject = true;

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "pmbootstrap";
    rev = version;
    hash = "sha256-neYTrKN8sf7kAbGfUr6NhpBjJ48ZqJNYYEyxLpTfskM=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [ "pmbootstrap" ];

  meta = with lib; {
    description = "Sophisticated chroot/build/flash tool to develop and install postmarketOS";
    homepage = "https://gitlab.com/postmarketOS/pmbootstrap";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "pmbootstrap";
  };
}
