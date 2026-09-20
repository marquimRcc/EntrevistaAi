#!/bin/bash
cd "$(dirname "$0")/backend"
mvn spring-boot:run -Dspring-boot.run.profiles=local
