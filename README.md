# TORC coding challenge

This is the code challenge issued by torq. This was what I was able to do in 4 hours od development.

## How to test

If you want to run the specs just do

`bundle exec rspec`

The inputs provided by the exercice are represented in the spec file receipt_spec.rb

## Functionality

There are 2 classes `Item` and `ExemptItem`. Each of them have the following responsabilities:

- How to calculate its sale tax
- how to calculate its import tax
- rounding operation according to the exercice
- have a string representation that will eventually be part of the receipt

## ItemParser class

This class is responsable of reading an item string input a create the appropriate item according to that string.
The possible results are an `Item` or an `ExemptItem`.

## Receipt Class

This class takes an array of `items` and prints the purchase receipt by giving the string representation of each item
and  finaly by outputing the total of taxes generated and the total amount of purchase such as:

```
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```
