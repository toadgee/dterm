# to add on 10.9:
sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT or REPLACE INTO access values ('kTCCServiceAccessibility', 'com.company.app', 0, 1, 0, NULL);"

# to remove
sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "delete from access where client='com.company.app';"
