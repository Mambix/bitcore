# Supported tags and respective `Dockerfile` links
* `latest` ([Dockerfile])

![Bitcore v4.1.0](https://img.shields.io/badge/bitcore-v4.1.0-green.svg)
[![](https://images.microbadger.com/badges/image/mambix/bitcore.svg)](https://microbadger.com/images/mambix/bitcore "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/mambix/bitcore.svg)](https://microbadger.com/images/mambix/bitcore "Get your own version badge on microbadger.com")

## Bitcore
Infrastructure to build Bitcoin and blockchain-based applications for the next generation of financial technology.

Links:
* [Bitcore site];
* [GitHub repo].

## Running the container

Create a volume where all data and blockchain data will be stored:

```
docker volume create --name bitcore_data
```

Now run the container, publishing ports 3001 (for Bitcore) and 8333 (for bitcoind).

```
docker run -d --restart=always --name bitcore \
   -p 3001:3001 -p 8333:8333 \
   -v bitcore_data:/root/.bitcore \
   mambix/bitcore
```

If you want to run Bitcore on the Testnet, first you need to add a configuration file to the data volume indicating that. Locate the data volume mount location on the Docker host:

```
docker volume inspect bitcore_data | grep Mountpoint
```

Create a file named `bitcore-node.json` in that directory with the following contents:

```
{
  "datadir": "/root/.bitcore/data",
  "network": "testnet",
  "port": 3001,
  "services": [
    "bitcoind",
    "db",
    "address",
    "web",
    "insight-api",
    "insight-ui"
  ]
}
```

Now run the container, publishing ports 3001 (for Bitcore) and 18333 (for bitcoind on Testnet):

```
docker run -d --restart=always --name bitcore \
   -p 3001:3001 -p 18333:18333 \
   -v bitcore_data:/root/.bitcore \
   mambix/bitcore
```


[Dockerfile]: <https://github.com/mambix/bitcore/blob/master/Dockerfile>
[GitHub repo]: <https://github.com/bitpay/bitcore>
[Bitcore site]: <https://bitcore.io/>
