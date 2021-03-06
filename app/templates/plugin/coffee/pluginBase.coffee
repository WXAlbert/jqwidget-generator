## Import required classes in correct order
#import Plugin

#
# Main <%= plugin_name %> class
#
# @author   <%= author_name %> (<%= author_mail %>)
# @version 0.0.1
class <%= plugin_name %> extends Plugin

  #default options
  defaultOptions = {}


  # Construct base class.
  #
  # @param [Object] jQuery plugin object
  # @param [Objects] User options
  # @param [String] Instance name
  # @param [String] Plugin name
  #
  constructor: (element, options, instanceName, @pluginName) ->
    options = $.extend({}, defaultOptions, options)
    super(element, options, instanceName)

    return

  # Initialize plugin
  #
  init: ->
    # Place your initialization methods here
    return


#______________________________________________________________
#                                         JQuery Initialisation

(($, window, document, undefined_) ->

  pluginName = "<%= plugin_name %>"
  $.fn[pluginName] = (options, languages) ->
    count = 0
    instanceCount = @.length
    @each ->
      count = count + 1
      if instanceCount is 1
        # if its only one instance do not generate
        # index number. Try to use elements id instead.
        # This will enable possibility to instantiate
        # plugin by id.
        count = '#' + $(this).attr('id')

      instanceName = pluginName + '_' + count
      newInstance = new <%= plugin_name %>(this, options, instanceName, pluginName, languages)
      unless $.data(this, instanceName)
        $.data this, instanceName, newInstance
        newInstance.init()
    return

  return
) jQuery, window, document
