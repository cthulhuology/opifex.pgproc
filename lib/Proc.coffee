# Proc.coffee
#
#	© 2013 Dave Goehrig <dave@dloh.org>
#

pgproc = require 'pgproc'

Proc = () ->
	this["connect"] = (database,schema) ->
		pgproc(database,schema)
		this.send { connect: "ok" }
	this["*"] = (method,args...) ->
		args.push( (row) =>  this.send row, this.dest, this.key )
		global[method].apply(global,args)

module.exports = Proc
