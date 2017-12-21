$page = Invoke-WebRequest -uri "https://watchguy.co.uk/cgi-bin/book"
$page.Content | select-string -pattern "Sorry" 
