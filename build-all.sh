#!/bin/bash

bash -c "cd 8.2-alpine; bash build.sh; bash push.sh"
bash -c "cd 8.3-alpine; bash build.sh; bash push.sh"
bash -c "cd 8.4-alpine; bash build.sh; bash push.sh"
bash -c "cd 8.5-alpine; bash build.sh; bash push.sh"
bash -c "cd latest; bash build.sh; bash push.sh"
