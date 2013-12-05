Opifex.pgproc
=================

Execute Postgres stored procedures over AMQP


Getting Started:
----------------

You can start up an opifex.pgproc as follows

	opifex 'amqp://guest:guest@localhost:5672//pg-in/#/pg/pg-out/pg' pgproc

This will route all messages on the pg-in exchange to the pg queue.  All of the output of the stored procedures will be 
written to the pg-out with the pg routing key. Procs are invoked with a message of the form:

	[ "procname", "arg1", "arg2", ..., "argN" ]

In order to connect the opifex worker to a database you must first issue a "connect" command:

	[ "connect", "postgres://user:password@localhost:5432/dbname", "public" ]

Where  user, password, localhost, 5432, dbname, and public are the postgres username, password, host, port, database name, and schema
whose stored procedures you want to expose to the message bus.

 
