# download_m3u8_to_ts
a bash script that can download m3u8 to ts with multiple process &amp; cache

usage:

bash download_m3u8_to_ts.sh  url file procs

url -> location of m3u8 file, support http, https, ftp protocol
file -> local file prefix
procs -> maximum number of concurrent processes for downloading ts segments

````bash
bash download_m3u8_to_ts.sh 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/2000.m3u8' test 10
````

will download m3u8 to test_xxx_of_xxx.ts and merge them into test_merged.ts, you can open test_merged.ts and enjoy your video

````bash
bash download_m3u8_to_ts.sh 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/2000.m3u8' test 10
downloading m3u8 from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/2000.m3u8'
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/2000.m3u8' as local file 'test.m3u8'
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  3289  100  3289    0     0   4831      0 --:--:-- --:--:-- --:--:--  4901
downloading ts from m3u8 file:
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/0.ts test_001_of_174.ts -s
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/0.ts' as local file 'test_001_of_174.ts'
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/1.ts test_002_of_174.ts -s
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/1.ts' as local file 'test_002_of_174.ts'
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/2.ts test_003_of_174.ts -s
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/2.ts' as local file 'test_003_of_174.ts'
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/3.ts test_004_of_174.ts -s
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/3.ts' as local file 'test_004_of_174.ts'
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/4.ts test_005_of_174.ts -s
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/4.ts' as local file 'test_005_of_174.ts'
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/5.ts test_006_of_174.ts -s
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/5.ts' as local file 'test_006_of_174.ts'
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/6.ts test_007_of_174.ts -s
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/6.ts' as local file 'test_007_of_174.ts'
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/7.ts test_008_of_174.ts -s
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/7.ts' as local file 'test_008_of_174.ts'
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/8.ts test_009_of_174.ts -s
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/8.ts' as local file 'test_009_of_174.ts'
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/9.ts test_010_of_174.ts -s
downloading file from url 'http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/9.ts' as local file 'test_010_of_174.ts'
shell_exec download_if_needed http://asp.cntv.lxdns.com/asp/hls/2000/0303000a/3/default/0cfee92ce5d74121a97b5ae451a02f64/10.ts test_011_of_174.ts -s
... # omitted
````

