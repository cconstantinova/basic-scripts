# Generate an letsencrypt certificate and install it in your webserver. 
# Redirect all HTTP traffic to HTTPS. use DNS chalenge for certificate sign - apache config - virtual host 443 
email="carinaconstantinova@gmail.com"

sudo apt-get update
sudo apt-get install certbot

sudo apt-get install python3-certbot-nginx

certbot certonly --manual --preferred-challenges dns --register-unsafely-without-email -q $email

sudo a2enmod ssl
sudo systemctl restart apache2