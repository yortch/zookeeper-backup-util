Zookeeper Backup Utility
========================

Container image to back up zookeeper partitions into Azure Blob Storage using:
* [zk-shell](https://github.com/rgs1/zk_shell) version 1.3.3
* [azcopy](https://github.com/Azure/azure-storage-azcopy/issues/423#issuecomment-562314661) 

Build command: 
```bash
docker build . -t zookeeper-backup-util:1.0
```

Usage: 
```bash
docker run -it zookeeper-backup-util:1.0
```