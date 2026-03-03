#!/bin/bash

# 1. Menyiapkan Variabel
CONTAINER_NAME="api-server"
LOG_FILE="server_monitor.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# 2. Mengecek status container (apakah ada di daftar 'docker ps' yang sedang hidup?)
if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    
    # JIKA MATI: Catat error ke file log, lalu nyalakan kembali
    echo "[$TIMESTAMP] CRITICAL: Container $CONTAINER_NAME mati! Melakukan restart otomatis..." >> $LOG_FILE
    docker start $CONTAINER_NAME
    echo "[$TIMESTAMP] RESOLVED: Container $CONTAINER_NAME berhasil dinyalakan kembali." >> $LOG_FILE

else
    
    # JIKA HIDUP: Catat status normal ke file log
    echo "[$TIMESTAMP] INFO: Container $CONTAINER_NAME berjalan dengan normal." >> $LOG_FILE

fi