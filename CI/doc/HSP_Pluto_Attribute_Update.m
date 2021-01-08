clear all;

rx = sdrrx('Pluto');
y = rx();
y = rx();
rx.CenterFrequency = 2.45e9;
y = rx();
release(rx);