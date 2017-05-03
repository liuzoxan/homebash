augeas {"ssh_config":
  context => "/files/etc/ssh/ssh_config",
  changes => [
    "set GSSAPIAuthentication no",
  ],
}
