ModelineView = require "./modeline-view"

module.exports =
    activate: (state) ->
        atom.workspaceView.eachEditorView (editor) ->
            if editor.attached and editor.getPane()?
                pane = editor.getPane()
                pane.modeline ?= new ModelineView(editor)
