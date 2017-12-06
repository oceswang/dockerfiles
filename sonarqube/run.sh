#!/bin/bash
chown -R sonarqube:sonarqube /usr/local/sonarqube
exec gosu sonarqube /usr/local/sonarqube/bin/linux-x86-64/sonar.sh console