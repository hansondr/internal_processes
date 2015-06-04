# Internal Processes [![Build Status](https://travis-ci.org/hansondr/internal_processes.svg?branch=master)](https://travis-ci.org/hansondr/internal_processes)

This is a container application to tie together a series of components.

## Create a new component

Run the component creation script from the project root:

'./new_component new_thing`

This will create a new mountable engine in the components directory 
and setup the basic configuration.  This includes setting the component up to
test in RSpec with a dummy application in `spec/dummy` and linking the
migrations so they are able to be run from the project root.
