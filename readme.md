# PG-DIFF 101

Target is old Database you need to migrate from source.

Source is new Database you need to update on the file such as directus and will migrate it back to Target (old)

## Prerequisites

- Postgresql
- Node
- pg-diff

## Install

`npm install -g pg-diff-cli`

## Create diff

```sh
pg-diff -c development initial-script
```

## Run migrate to target

```sh
pg-diff -mt development
```

## Ref

> https://michaelsogos.github.io/pg-diff/
