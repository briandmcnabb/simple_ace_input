class AceInput
  constructor: ->
    @editor   = ace.edit("editor")
    @session  = @editor.getSession()
    @renderer = @editor.renderer
    @textarea = $('textarea.ace')
    @setOptions()
    @updateMode()
    @updateTheme()
    @bindTextarea()

  setOptions: =>
    @renderer.setShowPrintMargin false
    @renderer.setHScrollBarAlwaysVisible false
    @session.setTabSize 2
    @session.setUseSoftTabs true
    @session.setFoldStyle "markbeginend"

  updateMode: (mode = @textarea.data('ace-mode'))=>
    mode = require("ace/mode/#{mode}").Mode
    @session.setMode new mode()

  updateTheme: (theme = @textarea.data('ace-theme'))=>
    @editor.setTheme "ace/theme/#{theme}"

  bindTextarea: =>
    ace = @
    ace.session.setValue ace.textarea.val()
    ace.session.on "change", ->
      ace.textarea.val ace.session.getValue()

window.AceInput = AceInput