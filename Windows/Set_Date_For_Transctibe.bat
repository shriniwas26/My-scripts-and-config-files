rem @echo off

SET x=%DATE:~4,10%

ECHO %x%

DATE 03/10/2014

timeout 60

date %x%

timeout 2

echo %date%

timeout 10