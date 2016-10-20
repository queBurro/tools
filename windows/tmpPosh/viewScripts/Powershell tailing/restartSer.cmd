echo #### RUN AS ADMINISTRATOR ####  

net stop "mosquitto"
net stop "ViewMessagingServer" 
net stop "ViewApplicationManager" 

net start "mosquitto"
net start "ViewMessagingServer" 
net start "ViewApplicationManager" 


pause

