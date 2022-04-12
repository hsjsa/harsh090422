TRACKERS=$(curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_udp.txt | awk '$1' | tr '\n' ',')

export MAX_DOWNLOAD_SPEED=0
export MAX_CONCURRENT_DOWNLOADS=10
aria2c --enable-rpc --rpc-listen-all=false --rpc-listen-port 6800 \
  --max-connection-per-server=10 --rpc-max-request-size=1024M \
  --seed-time=0.01 --bt-stop-timeout=900 --min-split-size=10M --follow-torrent=mem --split=10 \
   --daemon=true --allow-overwrite=true --max-overall-download-limit=$MAX_DOWNLOAD_SPEED \
   --max-overall-upload-limit=1K --max-concurrent-downloads=$MAX_CONCURRENT_DOWNLOADS \
--peer-agent=qBittorrent/4.3.6 \
--peer-id-prefix=-qB4360- \
--seed-time=0 \
--bt-tracker-connect-timeout=300 \
--bt-stop-timeout=1200 \
--user-agent=qBittorrent/4.3.6
