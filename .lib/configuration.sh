# Configuration files for the Shell Tutor
#
# Configuration values are stored in a hierarchy:
# 0. `tutor.conf` located in the shell tutor library directory
# 1. Hidden `.tutor.conf` located in the shell tutor distribution (same level as the lesson files)
# 2. Default values hadrdcoded here
#
# All configuration files will be sourced if present, but may be overriden by values with a higher precedence in the hierarchy


# Default values to ensure Shell Tutor does not get into weird states if 
# certain configuration values are not present
_MAINTAINER_EMAIL=erik.falor@usu.edu
_DEPLOYMENT_NAME="NOT_CONFIGURED"

# Tutor configuration file under .lib/
if [[ -f .lib/tutor.conf ]]; then
    source .lib/tutor.conf
fi

# Tutor configuration file at the repository root
if [[ -f ./.tutor.conf ]]; then
    source ./.tutor.conf
fi
