#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with dante](#setup)
    * [What dante affects](#what-dante-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with dante](#beginning-with-dante)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

A Puppet module which manages the Dante socks server.

## Module Description

This module manges the dante socks server on RHEL 7 systems. Currently the module only supports basic funtionality, but I wrote it with extensibility mind. You can use hiera to configure the settings, or just set the class parameters in puppet DSL.

## Setup

### What dante affects

* installs the dante-server package.
* creates a sockd.conf file from an erb template.
* starts the sockd service.

### Setup Requirements **OPTIONAL**

You will need a working dante-server package.

### Beginning with dante

Just look at the dante class parameters. The defaults should get you up and running.

## Usage

Unfortunately you have to look at the parameters of the dante class.

## Reference

For now you have to look at the source code and the sockd.conf erb template.

## Limitations

RHEL 7 only, but porting should be easy.

## Development

Please try to match the coding style of the module, even it's not your thing. Try to not break compatibility for existing users and if you have to, ther should be a good reason. This module should work with and without hiera.
