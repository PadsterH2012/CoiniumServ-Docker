FROM mono:3.12

ADD Release /usr/local/bin/CoiniumServ/build/release

EXPOSE 80

CMD ["mono", "/usr/local/bin/CoiniumServ/build/release/CoiniumServ.exe"]
