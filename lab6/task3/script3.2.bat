sc query | find /i "service_name" > all_services.txt

net stop InstallService

timeout /t 20
sc query | find /i "service_name" > all_services_new.txt

start /b script3.2_3.bat

net start InstallService