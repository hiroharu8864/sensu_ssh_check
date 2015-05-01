#!/usr/bin/env ruby
#
# Check SSH User
#
require 'sensu-plugin/check/cli'

class CheckSshUsers < Sensu::Plugin::Check::CLI
  check_name 'check_ssh_users'

  option :user_name,
    short:       "-u user_name",
    long:        "--user user_name",
    description: "Define UserName(Require)"

  def run
    check_command = "who | awk '{print $1}' | grep ^#{config[:user_name]}$ > /dev/null 2>&1"
    check_result = system(check_command)

    if !check_result
      ok "#{config[:user_name]} doesn't exist"
    else
      critical "#{config[:user_name]} exists"
    end
  end
end
