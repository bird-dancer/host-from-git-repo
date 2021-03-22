echo $(apt-get install nginx git -y)
read -p 'What is the domain? ' domain
read -p 'What is the websites name? ' name
echo $(mkdir -p /var/www/$name/$name.git)
echo $(git init --bare /var/www/$name/$name.git)
echo $(mkdir -p /var/www/$name/content)
#! add new user if wanted and change permissions
read -p 'Who is the owner of this workflow? ' owner
echo $(chown -R $owner /var/www/$name)
#! nginx setup
echo $(rm /etc/nginx/sites-available/$name)
echo $(touch /etc/nginx/sites-available/$name)
echo "
	server {
	listen 80;
	listen [::]:80;
	root /var/www/$name/content/html;
	index index.html index.htm index.php;
	server_name $domain;
location / {"'
	try_files $uri $uri/ =404;
	}
}
' > /etc/nginx/sites-available/$name
echo $(rm /etc/nginx/sites-enabled/$name)
echo $(ln -s /etc/nginx/sites-available/$name /etc/nginx/sites-enabled/$name)
#! ssl stuff
echo $(touch /var/www/$name/$name.git/hooks/post-receive)
echo "
git --work-tree=/var/www/$name/content --git-dir=/var/www/$name/$name.git checkout -f master
" > /var/www/$name/$name.git/hooks/post-receive
echo $(chmod +x /var/www/$name/$name.git/hooks/post-receive)
echo $(systemctl restart nginx)
#echo $(certbot --nginx -d $domain)
