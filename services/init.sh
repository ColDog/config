#!/bin/bash

cp sync-documents.service /etc/systemd/system/
cp sync-documents.timer /etc/systemd/system/

systemctl daemon-reload
systemctl enable sync-documents.timer
systemctl enable sync-documents.service
systemctl start sync-documents.timer
