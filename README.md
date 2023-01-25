# docker-fio

fio examples/http-s3f.fio --time_based --runtime=120 --section=create

# cat examples/http-s3f.fio
# Example test for the HTTP engine's S3 support against Amazon AWS.
# Obviously, you have to adjust the S3 credentials; for this example,
# they're passed in via the environment.
#

[global]
ioengine=http
name=test
direct=1
filename=/test/fio-test/object
http_verbose=0
https=off
http_mode=s3
http_s3_keyid=29cw......K
http_s3_key=JsC..........................
http_host=192.168.128.253
http_s3_region=eu-central-1
group_reporting

# With verify, this both writes and reads the object
[create]
rw=write
bs=4k
size=64k
io_size=4k
verify=sha256

[trim]
stonewall
rw=trim
bs=4k
size=64k
io_size=4k

