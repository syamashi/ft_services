if [ ! "pgrep nginx" ]; then
  return 1
fi

if [ ! "pgrep telegraf" ]; then
	return 1
fi