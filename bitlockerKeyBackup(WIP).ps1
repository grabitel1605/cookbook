# Still needs work!!!
# How can I make this script run as admin or with admin creds?
# Get the "Numerical Password ID"
manage-bde -protectors -get c:
# How do I retrieve this from the output?
#How do I store the "Numerical Password ID" in a variable?

Backup-BitLockerKeyProtector -MountPoint "C:" -KeyProtectorId "{Numeric ID}"
#^^^ The variable with the "Numerical Password ID" would be passed in here in place of the "{Numberic ID}"