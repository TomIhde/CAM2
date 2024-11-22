#!/bin/bash
find /app/model -type f | xargs dos2unix
atlantisMerged -i init_CAM.nc 0 -o CAM_output.nc -r CAM_run.prm -f CAM_forceNCOMhydro.prm -p VMPA_setas_physics.prm -b CAM_bio.prm -m CAM_migrations.csv -h CAM_harvest_F.prm -e VMPA_setas_economics.prm -s CAM_groups.csv -q CAM_fisheries.csv -t . -d output