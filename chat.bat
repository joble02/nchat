@echo off

echo press 1, then enter for server
echo press 2, then enter for client
set /p server=$ 
if %server% == 1 goto :server else goto :client

:client

mode con: cols=82 lines=1

set /p ip=ip of server? 
set /p port=port of server? 
set /p user=Username? 

start cmd /k "echo This is the display window, go back to the first one to send messages & ncat.exe %ip% %port%"

:loop
set /p towrite=$ 
echo #%user%# %towrite% | ncat.exe %ip% %port% -i 1ms
goto :loop

:server
echo Port? 
set /p port=$ 

ipconfig
echo Under ipv4 is the address to give your friends
echo The server is running, you don't need to touch this prompt anymore

ncat.exe --broker -p %port%
