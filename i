auth_param basic program /usr/lib/squid3/basic_ncsa_auth /etc/squid3/allow
auth_param basic children 2
auth_param basic realm DILARANG ACCESS !!!
auth_param basic credentialsttl 24 hours
auth_param basic casesensitive off
acl users proxy_auth REQUIRED
acl CONNECT method CONNECT
acl NET dst $MYIP2
http_access allow NET
http_access allow CONNECT
http_access deny all
http_port 8080
https_port 8080
icp_access allow all
cache_dir ufs /var/spool/squid3 40000 59 256
cache_access_log /var/log/squid3/access.log
cache_log /var/log/squid3/cache.log
coredump_dir /var/spool/squid
dns_nameservers 208.67.222.222, 208.67.220.220
quick_abort_min 1 KB
quick_abort_max 1 KB
quick_abort_pct 99
range_offset_limit 1 KB
minimum_expiry_time 1 seconds
negative_ttl 1 second
negative_dns_ttl 1 minute
forward_timeout 2 minutes
positive_dns_ttl 24 hour
retry_on_error on
via off
forwarded_for off
visible_hostname meow.rzp.my
refresh_pattern ^ftp:  1440 20% 10080
refresh_pattern ^gopher: 1440 0% 1440
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
refresh_pattern (index|home|default)\.(htm|php|asp|asp|aspx|shtml|cfm|cfml|phtml) 0 0% 0
refresh_pattern \.(htm|php|asp|asp|aspx|shtml|cfm|cfml|phtml|jsp|cgi|asx|css|js|xml)\? 0 0% 0
refresh_pattern . 0 50% 1440 reload-into-ims
refresh_pattern -i \.(gif|png|pnp|img|jpg|jpeg|jpe?g|jpeg2|ico|mod|bmp|eps|tif|tiff?|pcx|pic|tga|iff|sct|pxr|raw|dcs|rle|lzw|ccit|f3d|woff)$ 10080 99% 40320 override-expire override-lastmod reload-into-ims ignore-reload ignore-no-store ignore-must-revalidate  ignore-private ignore-auth refresh-ims  store-stale
refresh_pattern -i \.(pps|ppsx|ps|rtx|wpl|doc|docx|pdf|xls|xlsx|latex|ppt|pptx|mbd|asm|bat|psd)$ 10080 80% 40320 override-expire override-lastmod reload-into-ims ignore-reload ignore-no-store ignore-must-revalidate  ignore-private ignore-auth refresh-ims  store-stale
refresh_pattern -i \.(mp4|3ivx|asf|avi|m2ts|divx|mjpeg|ogv|webm|mpg|mpeg|ogg|wmv|mkv|3gp|flv|x-flv|3g2|vob|swf|swz|mov|m4v)$ 10080 99% 40320 override-expire override-lastmod reload-into-ims ignore-reload ignore-no-store ignore-must-revalidate  ignore-private ignore-auth refresh-ims  store-stale
refresh_pattern -i \.(ogg|mp2|ac3|mpc|m4a|flac|aiff|aif|aifc|raw|au|mid|wav|wv|mp3|gsm|dct|aac|mmf|wma|atrac|ra|ram|dss|msv|dvf|m4p|amr|awb|ape|apl)$ 10080 99% 40320 override-expire override-lastmod reload-into-ims ignore-reload ignore-no-store ignore-must-revalidate  ignore-private ignore-auth refresh-ims  store-stale
refresh_pattern -i \.(exe|dfg|crx|7z|mds|mod|mdl|arj|bz2|ms-dos|ccd|sub|deb|cab|pak|bin|cue|nrg|isz|mdf|qt|zip|tar|jar|jxr|jad|tar.gz|tar|msi|inc)$ 10080 99% 40320 override-expire override-lastmod reload-into-ims ignore-reload ignore-no-store ignore-must-revalidate  ignore-private ignore-auth refresh-ims  store-stale
refresh_pattern -i \.(lha|ms(i|p|u)|rpm|rtp|rpz|nui|kom|stg|pak|sup|nzp|npz|tgz|reg|vpx|avc|ref|msp|iso|rar|mar|pkg|gmf|apk|bfz|auz)$ 10080 99% 40320 override-expire override-lastmod reload-into-ims ignore-reload ignore-no-store ignore-must-revalidate  ignore-private ignore-auth refresh-ims  store-stale
