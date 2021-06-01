# PG-DIFF 101

Target is old Database you need to migrate from source.

Source is new Database you need to update on the file such as directus and will migrate it back to Target (old)

## Prerequisites

- Postgresql
- Node
- pg-diff

## Install

`npm install -g pg-diff-cli`

## Development

### Pre-pair

Create 2 database follow `pg-diff-config.json`

- `directus-101` is new database change by Directus (source)
- `directus-100` is old database (target)

### Create diff

```sh
pg-diff -c development initial-script
```

> `initial-script` is name of migration file.

### Run migrate to target

```sh
pg-diff -mt development
```

## Concern

- support only migrate up

## Ref

> https://michaelsogos.github.io/pg-diff/
