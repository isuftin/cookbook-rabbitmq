default["rabbitmq"]["enabled_users"] = [
  { 
    "name" => "test-user",
    "password" => "test-pass",
    "tag" => "administrator",
    "rights" => [{ "conf" => ".*", "write" => ".*", "read" => ".*" }]
  }
]
