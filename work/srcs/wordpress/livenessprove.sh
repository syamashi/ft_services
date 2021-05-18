if [ ! "pgrep nginx" ]; then
  return 1
fi

if [ ! "pgrep php-fpm7" ]; then
	return 1
fi

if [ ! "pgrep telegraf" ]; then
	return 1
fi