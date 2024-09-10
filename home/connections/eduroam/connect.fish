#!/usr/bin/env fish

echo "Enter Eduroam identity: "
read IDENTITY

echo "Enter Eduroam password: "
read -s PASSWORD
echo

wpa_passphrase eduroam "$PASSWORD" > eduroam.profile
sed -i "/{/a \    identity=\"$IDENTITY\"\n    password=\"$PASSWORD\"" eduroam.profile

echo "Generated eduroam.profile."

# Connect using wpa_supplicant
echo "Connecting to Eduroam..."
sudo wpa_supplicant -i wlo1 -c ./eduroam.profile


