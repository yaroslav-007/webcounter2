####Creating config file for redis

mkdir /etc/redis.d
cat >  /etc/redis.d/redis.conf << EOF
port              6379
daemonize         yes
save              60 1
bind              127.0.0.1
tcp-keepalive     300
dbfilename        dump.rdb
dir               ./
rdbcompression    yes

EOF


###Creating redis service file:
cat >  /etc/systemd/system/redis.service <<- "EOF"
[Unit]
Description="Redis server for the web counter"
Documentation=https://redis.io/
Requires=network-online.target
After=network-online.target
ConditionFileNotEmpty=/etc/redis/redis.conf

[Service]
User=vagrant
Group=vagrant
ExecStart=/usr/bin/redis-server /etc/redis.d/redis.conf --supervised systemd
ExecStop=/usr/bin/redis-cli shutdown
KillMode=process
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

###Enable the redis service
systemctl daemon-reload
systemctl start redis-server
systemctl enable redis-server