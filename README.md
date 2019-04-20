# nyzo-docker

Docker container builder for Nyzo-verifier.

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Build and Run

Build and run nyzo-verifier container using command below.

```shell
docker-compose up -d
```

See verifer stdout logs using tail.

```shell
docker exec -it nyzo-verifier tail -f /var/log/nyzo-verifier-stdout.log 
```

#### Environment Variables

* `[$PRIVATE_KEY]` - Comment out section and add existing private key

#### Volumes

* `/var/lib/nyzo/production` - Consider adding directory as volume 

#### Files

* `Dockerfile` - Docker file
  
* `docker-compose.yml` - Docker Compose file

* `supervisord.conf` - Custom supervisord Config file

## License

This project is licensed under the MIT License.

## Wallet

```shell
164de64a9933a0cc-cde16c5891177c61-760741df4616c2e3-d61504aad75d9d11
```
