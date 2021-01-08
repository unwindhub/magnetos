export MAX_DOWNLOAD_SPEED=0
export MAX_CONCURRENT_DOWNLOADS=3
trackers_list=$(curl -Ns https://cdn.jsdelivr.net/gh/XIU2/TrackersListCollection@master/all.txt | awk '$1' | tr '\n' ',')
aria2c --enable-rpc --rpc-listen-all=false --rpc-listen-port 6800 \
   --max-connection-per-server=10 --daemon=true \
   --max-overall-download-limit=$MAX_DOWNLOAD_SPEED \
   --bt-tracker="[$trackers_list]" --max-concurrent-downloads=$MAX_CONCURRENT_DOWNLOADS \
   --rpc-max-request-size=1024M --seed-time=0.01 --min-split-size=10M \
   --bt-max-peers=0 --follow-torrent=mem --split=10 --max-overall-upload-limit=1K
