Tech Test: Vending Machine
==========================
[![Code Climate](https://codeclimate.com/github/foxjerem/vending-machine/badges/gpa.svg)](https://codeclimate.com/github/foxjerem/vending-machine) [![Test Coverage](https://codeclimate.com/github/foxjerem/vending-machine/badges/coverage.svg)](https://codeclimate.com/github/foxjerem/vending-machine)

Ruby Version:
-------------
Ruby 2.1.2

Objectives:
-----------
- Design a vending machine in code
- Machine should have an initial load of products and change and can be subsequently reloaded
- Machine will release a product if sufficient funds are given
- Machine will return change if too much money is given

Classes:
--------
- Vending Machine: returns a product in exchange for money
- Product: item with a price and id
- Basket: collection of products
- Change: has a denomination and amount

Workings:
---------
- Change object is creating using denominations in pence rather than strings e.g '£1', but could be easily adapted to translate if required
- Did not add functionality to reload machine to runner script due to time constraints but functionality is demonstrated in tests

Running the test suite:
-----------------------
From root directory:
```shell
$ rspec
```

Running the Application:
------------------------
From root directory:
```shell
$ ruby run.rb
```
Output:
```shell
Machine Contents
[#<Product:0x007fc9ca9028d8 @id=0, @price=55>,     
#<Product:0x007fc9ca05ff78 @id=1, @price=75>,     
#<Product:0x007fc9ca05eec0 @id=2, @price=97>]
Please enter a product id:
1
Please enter money provided
99
[#<Product:0x007fc97085e7b0 @id=1, @price=75>,     
[#<Change:0x007fc97084d2d0 @denomination=20, @amount=1>,     
#<Change:0x007fc97084d280 @denomination=2, @amount=2>]]
```
