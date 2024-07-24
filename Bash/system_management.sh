 #!/usr/bin/env bash

 free -m | grep Mem | awk -v timestamp="$(date)" '{print timestamp,"-->",$4,"MB"}' >> ~/backups/freemem/free_mem.txt

 mpstat 1 5 | awk -v timestamp="$(date)" 'END{print timestamp,"-->",100-$NF"%"}' >> ~/backups/diskuse/disk_usage.txt

 echo "$(date) --> $(lsof | wc -l)" >> ~/backups/openlist/open_list_count.txt
 echo "$(date) --> all open files:" >> ~/backups/openlist/open_list.txt
 lsof >> ~/backups/openlist/open_list.txt
 
 echo "$(date) --> disk stats for filesystem mounted on '/':" >> ~/backups/freedisk/free_disk.txt
 df -h / >> ~/backups/freedisk/free_disk.txt