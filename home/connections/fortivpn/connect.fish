#!/usr/bin/env fish

openfortivpn-webview --url 'https://epxvpn.ciena.com/remote/saml/start?realm=partner' --trusted-cert='sha256/HJdEvkbyTW9ygH0azudaf8VN2Fuvl8odWWghLPX+T6c=' 2>/dev/null | sudo openfortivpn "epxvpn.ciena.com:443" --cookie-on-stdin --pppd-accept-remote --trusted-cert aa8c394f40777bf4a9908819ea9799826020470ca8156376762d9402baa96c34
