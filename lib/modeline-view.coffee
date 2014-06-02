{View} = require "atom"

module.exports =
class ModelineView extends View
    @content: ->
        @div class:"modeline", =>
            @div outlet:'rightPanel', class:'modeline-right pull-right'
            @div outlet:'leftPanel', class: 'modeline-left'

    initialize: (@editorView) ->
        @pane = @editorView.getPane()

        @pane.append(this) unless @hasParent()
        @subscribe @pane, 'pane:active-item-changed', @update

        @update()

    update: =>
        if path = @pane.getActiveItem()?.getPath?()
            @leftPanel.text(atom.project.relativize(path))
        else if title = @pane.getActiveItem()?.getTitle?()
            @leftPanel.text(title)
        else
            @leftPanel.text("")
