# TheGraph

## Without TheGraph

How to do?

1. Create node server
2. Fetch events or state data throw RPC or Subscribe events.
3. Save data to db

this is not optimal:

- Doesn't work for already deployed contracts.
- Extra gas costs for storing those values.
- Requires another call to fetch the data for an Ethereum node.

## A better solution:  TheGraph 

Learn: https://thegraph.com/ecosystem/learn/

- Build faster 100% less servers

  Create groundbreaking applications without needing to run your own data server, build indexing infrastructure, or parse through raw data.

- Spend less 60-98% less per month

  Cut down on costs and time spent running expensive infrastructure by tapping into The Graph’s competitive data market.

- Increase resilience 99.99%+ uptime

  Ensure your application’s uptime and keep its data flowing 24/7 with a globally distributed network of contributors.

![](https://thegraph.com/docs/_next/static/media/graph-dataflow.4a0efacc.png)

## What is GraphQL

1. Site: https://graphql.org/
2. Example: 

   1.   [query UniswapV3 data](https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v3/graphql)
   2.  [query UniswapV3](https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v3?source=uniswap)
   3.  [uniswap-v2-dev](https://api.thegraph.com/subgraphs/name/ianlapham/uniswap-v2-dev)

3. call GraphQL: https://graphql.org/graphql-js/graphql-clients/

```js
fetch("/graphql", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    Accept: "application/json",
  },
  body: JSON.stringify({ query: "{ hello }" }),
})
  .then(r => r.json())
  .then(data => console.log("data returned:", data))
```

## Deploy a subgraph

https://thegraph.com/docs/en/developing/creating-a-subgraph/

Public RPC Node: https://ethereum-sepolia.publicnode.com

1. Deploy Contract 
2. Get ABI
3. Create Subgraph project
4. Graph init 
5. Graph codegen & graph build. & grpah deploy
   1. Example: https://api.studio.thegraph.com/proxy/64062/mybank/v0.0.3/graphql
   2. Contract Address: [0x3FD542687000843F7B1d79945E8D1b7B44c09FD1](https://sepolia.etherscan.io/address/0x3fd542687000843f7b1d79945e8d1b7b44c09fd1)
6. Add new contract (`grpah add `)
7. Query:  call by http (GraphQL)