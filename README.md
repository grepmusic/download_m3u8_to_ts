# download_m3u8_to_ts
a bash script that can download m3u8 to ts with multiple process &amp; cache

usage:

bash download_m3u8_to_ts.sh  url file procs

url -> location of m3u8 file, support http, https, ftp protocol
file -> local file prefix
procs -> maximum number of concurrent processes for downloading ts segments

bash download_m3u8_to_ts.sh 'https://hot.vrs.sohu.com/ipad2380276_4601523816445_5591597.m3u8?vid=2380276&uid=1703230111313380&plat=17&SOHUSVP=Cvr4qQPa9nlW30r6RhKewKde1dpmKXbHKicFHJLiohI&pt=3&prod=h5&pg=1&eye=0&cv=1.0.0&qd=68000&src=11050001&ca=4&cateCode=101&_c=1&appid=tv&oth=&cd=' test 10

will download m3u8 to test_xxx_of_xxx.ts and merge them into test_merged.ts, you can open test_merged.ts and enjoy your video

<pre>
$ bash download_m3u8_to_ts.sh 'https://hot.vrs.sohu.com/ipad2380276_4601523816445_5591597.m3u8?vid=2380276&uid=1703230111313380&plat=17&SOHUSVP=Cvr4qQPa9nlW30r6RhKewKde1dpmKXbHKicFHJLiohI&pt=3&prod=h5&pg=1&eye=0&cv=1.0.0&qd=68000&src=11050001&ca=4&cateCode=101&_c=1&appid=tv&oth=&cd=' test 10
downloading m3u8 from url 'https://hot.vrs.sohu.com/ipad2380276_4601523816445_5591597.m3u8?vid=2380276&uid=1703230111313380&plat=17&SOHUSVP=Cvr4qQPa9nlW30r6RhKewKde1dpmKXbHKicFHJLiohI&pt=3&prod=h5&pg=1&eye=0&cv=1.0.0&qd=68000&src=11050001&ca=4&cateCode=101&_c=1&appid=tv&oth=&cd='
downloading file from url 'https://hot.vrs.sohu.com/ipad2380276_4601523816445_5591597.m3u8?vid=2380276&uid=1703230111313380&plat=17&SOHUSVP=Cvr4qQPa9nlW30r6RhKewKde1dpmKXbHKicFHJLiohI&pt=3&prod=h5&pg=1&eye=0&cv=1.0.0&qd=68000&src=11050001&ca=4&cateCode=101&_c=1&appid=tv&oth=&cd=' as local file 'test.m3u8'
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 14087    0 14087    0     0  70782      0 --:--:-- --:--:-- --:--:-- 73369
downloading ts from m3u8 file:
shell_exec download_if_needed http://220.181.61.240/m3u8?&start=0&end=9.8&k=hWODtfkIlBytlB64ZhcmgeWXgEkAW4EGN6w7e6K6ohALyDdD5m47fFo70F2OvmfVZD6HfYXswm6AZDNXfY1swm1UoTbcWhyS0pviNF2CfDoGNh24r&a=hWqbzHJUhWqFjfaptUJlzSwdoSwGoSNGopwGoSoWj9lvzSwiopoAomrGoSwmoSom0prWkCIv8eWM8Y2Fymv4086bohAiq6yOWpvt8SxlNMylNL8sNL1UD4dGhK9CN4ovhEsCgVxvvm1mRD6S0mEAZDvORY1OfBNSoMAARDx&sig=T3OuUdrFKThxBpe3CSubm3yXj21CFr1G test_001_of_036.ts -s
downloading file from url 'http://220.181.61.240/m3u8?&start=0&end=9.8&k=hWODtfkIlBytlB64ZhcmgeWXgEkAW4EGN6w7e6K6ohALyDdD5m47fFo70F2OvmfVZD6HfYXswm6AZDNXfY1swm1UoTbcWhyS0pviNF2CfDoGNh24r&a=hWqbzHJUhWqFjfaptUJlzSwdoSwGoSNGopwGoSoWj9lvzSwiopoAomrGoSwmoSom0prWkCIv8eWM8Y2Fymv4086bohAiq6yOWpvt8SxlNMylNL8sNL1UD4dGhK9CN4ovhEsCgVxvvm1mRD6S0mEAZDvORY1OfBNSoMAARDx&sig=T3OuUdrFKThxBpe3CSubm3yXj21CFr1G' as local file 'test_001_of_036.ts'

</pre>

