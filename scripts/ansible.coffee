spawn = require('child_process').spawn

module.exports = (robot) ->

  #robot.hear /badger/i, (res) ->
    #res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  robot.respond /ping all/i, (res) ->
    #build = spawn '/bin/bash', ['test.sh']
    build = spawn 'ansible', ['all','-m','ping']
    build.stdout.on 'data', (data) -> res.send data.toString()
    build.stderr.on 'data', (data) -> res.send data.toString()
