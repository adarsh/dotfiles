#!/usr/bin/env python

import os
import re
import subprocess
import sys

def get_keychain_pass(account=None, server=None):
  home = os.environ.get('HOME')
  user = os.environ.get('USER')

  params = {
          'security': '/usr/bin/security',
          'command': 'find-internet-password',
          'account': account,
          'server': server,
          'keychain': home + '/Library/Keychains/login.keychain',
          'user': user,
          }
  command = "sudo -u %(user)s %(security)s -v %(command)s -g -a %(account)s -s %(server)s %(keychain)s" % params
  output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
  outtext = [l for l in output.splitlines()
          if l.startswith('password: ')][0]

  return re.match(r'password: "(.*)"', outtext).group(1)
