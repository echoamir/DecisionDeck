#!/bin/bash

TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_DIR="/home/username/backups"
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"
REMOTE_USER="remote_username"
REMOTE_HOST="remote_host"
REMOTE_DIR="/path/to/remote/directory"
CONTAINER_NAME="postgres_container_name"  

mkdir -p $BACKUP_DIR

docker exec -t $CONTAINER_NAME pg_dump -U postgres database_name > $BACKUP_FILE

scp $BACKUP_FILE $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

find $BACKUP_DIR -type f -mtime +7 -name "*.sql" -exec rm {} \;

