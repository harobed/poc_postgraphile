# POC Postgraphile

[Context Tweet](https://twitter.com/klein_stephane/status/1010492760615456769)

> Je me lance dans un petit test de #PostGraphile (https://www.graphile.org/postgraphile/ ) #postgresql #graphql


In this project I try [Postgraphile](https://www.graphile.org/postgraphile/) with [PostGraphile Forum Example](https://github.com/graphile/postgraphile/tree/master/examples/forum).

## Prerequisite

* Only Docker and docker-compose

## Instruction

```
$ make up
...
Open your browser at http://0.0.0.0:32771/graphiql
```

Test this [GraphQL](https://en.wikipedia.org/wiki/GraphQL) query:

```
{
  allPosts {
    edges {
      node {
        id
        headline
      }
    }
  }
}
```


```
{
  searchPosts(search: "Ameliorated", first: 5) {
    edges {
      cursor
      node {
        headline
        body
      }
    }
  }
}
```
