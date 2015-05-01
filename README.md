# sensu_ssh_check
指定のSSHログインユーザが存在しないことを確認するsensu plugin

# usage
```
{$RUBY_PATH}/ruby check-ssh-user.rb -u USERNAME
```
USERNAMEがSSHログインしていればCRITICALを返す。
