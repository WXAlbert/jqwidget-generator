#==========================================================================
#=                                MAIN TESTS                              =
#==========================================================================

#
# @author: <%= author_name %> (<%= author_mail %>)
# @version: 0.0.1
#
# Basic tests which check general plugin behaviour and correct
# initialisation as well as basic translations editing.
#

#==========  HELPER METHODS AND VARIABLES  ==========

# number of plugin instances in testing .html file



#==========  Casper.js Main Tests creation  ==========

###
Create tests for initializing plugin by
element id name.
###
casper.test.begin "Initialization by ID", 0, (test) ->
  initializeMultiple = ->
    isInit = ""
    try
      $("#<%= plugin_name %>").<%= plugin_name %>
        debug: false
    catch e
      isInit = e.message
    isInit
  casper.start "http://localhost:9001/test.html", ->
    test.assertNot @evaluate(initializeMultiple), "Initialisation"
    commonTests test, this
    return

  casper.run =>
    test.done()
    return
  return

###
Create tests for initializing plugin
by elements class name.
###
casper.test.begin "Initialization by class", 0, (test) ->
  initializeSingle = ->
    isInit = ""
    try
      $(".<%= plugin_name %>-wrapper").<%= plugin_name %>
        debug: true
    catch e
      isInit = e.message
    isInit
  casper.start "http://localhost:9001/test.html", ->
    test.assertNot @evaluate(initializeSingle), "Initialisation"
    commonTests test, this

    return

  casper.run =>
    test.done()
    return

  return



#==========  TESTING METHODS  ==========


##
#
# Perform commont test for both initialisation modes.
#
# @param casper.js test object
# @param current scope
#
commonTests = (test, _this) ->


  return

