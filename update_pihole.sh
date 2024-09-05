#!/bin/bash
docker pull pihole/pihole
docker compose down
docker compose up -d
