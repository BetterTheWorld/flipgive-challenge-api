# API Challenge

The goal of this challenge is to test the applicant's knowledge of APIs, Rails, and data processing. The _endpoint_ is described below along with the _requirements_ of this challenge.

## Endpoint

Paginated data can be fetched via a GET request to the following URL: [https://fg-challenge-api.herokuapp.com/orders?page=1](https://fg-challenge-api.herokuapp.com/orders?page=1). Each subsequent page can be reached by increasing the page query parameter until the result is an empty array.

The data looks like:

```json
[
  {
    "ref": "2abac0a73fd03f0e818c",
    "order_type": "sale",
    "amount": "22.28",
    "ordered_at": "2019-08-15T20:02:20.113Z",
    "email": "customer1@email.com",
    "name": "Customer 1"
  },
  {
    "ref": "256c8726fd18a1be0b7a",
    "order_type": "refund",
    "amount": "-55.31",
    "ordered_at": "2019-08-18T20:02:20.210Z",
    "email": "customer38@email.com",
    "name": "Customer 38"
  }
]
```

There are 2 types of orders: `sale` and `refund`. A `refund` record will have the same `ref` as its corresponding `sale`.

## Requirements

- Create a new Rails app in order to process the above endpoint's data.
- Create a single new Model called `Order` for storing the processed data with the following columns:
  - All columns included in the endpoint... choose appropriate data types.
  - A `refund_id` column which will point to the corresponding refund record when a sale has been refunded. This will only be populated when the sale has been refunded. A `sale` and a `refund` are linked by their `ref` which is the same for both records.
- Define a rake task which will process the data for all pages of the endpoint.
- This rake task must be able to be re-run without storing duplicate data.

## Outputs

- The code that meets the above requirements.
- The Total Amount of all sales which have not been refunded.
- The percentage of orders which have been refunded.
- Be prepared to explain your thought process and the solution you came up with.
