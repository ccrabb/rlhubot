#
# Author:
#   ckissinger
#
module.exports = (robot) ->
    robot.respond /yo$/i, (msg) ->
        msg.send "yo"
