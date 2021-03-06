{ stdenv
, mkRosPackage
, robonomics_comm
, pkgs
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "temperature_sensor_demo";
  version = "0.1.0";

  src = ./.;

  propagatedBuildInputs = [ robonomics_comm pkgs.python37Packages.ipfsapi ];

  meta = with stdenv.lib; {
    description = "Temperature Sensor Demo";
    homepage = http://github.com/vourhey/temperature_sensor_demo;
    license = licenses.bsd3;
    maintainers = with maintainers; [ vourhey ];
  };
}
