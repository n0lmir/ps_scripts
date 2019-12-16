$root = "D:\Test"
#Add the folders manually to avoid problems
$paths = ($root + "\" + "New folde2"), 
    ($root + "\" + "New folder"),
    ($root + "\" + "Spain")


#add how many days back you want to have
$limit = (Get-Date).AddDays(-10)

#change the creation time (for testing purposes)
Get-ChildItem $path -Recurse | ForEach-Object { $_.CreationTime = '01/01/1900 12:42AM' }

#print the items
Get-ChildItem $path -Recurse | ForEach-Object { $_.CreationTime, $_.name }
#-lt - less than
#-gt - greater than
Get-ChildItem $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } 

#delete all items in the folders in paths , older than 10 days 
foreach($folder in $paths){
    Get-ChildItem $folder -Recurse -Force | Where-Object {!$_.PSIsContainer -and $_.CreationTime -lt $limit}
}



