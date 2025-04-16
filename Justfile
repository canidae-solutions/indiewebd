start:
  mprocs

dev-server:
  mix phx.server
repl:
  iex -S mix phx.server

test:
  mix test

dev-setup:
  initdb
  just start-db
  createuser -h $PGDATA -d indiewebd
  mix setup
  just stop-db

start-db:
  pg_ctl -l "$PGDATA/postgres.log" -o "-c unix_socket_directories='$PGDATA'" start
stop-db:
  pg_ctl stop
db:
  postgres -c unix_socket_directories="$PGDATA"
