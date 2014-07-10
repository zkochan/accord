Adapter = require '../adapter_base'
W       = require 'when'

class MinifyCSS extends Adapter
  name: 'minify-css'
  extensions: ['css']
  output: 'css'
  supportedEngines: ['clean-css']

  ###*
   * It is sometimes isolated, but not always because you can get it to process
     `import` rules with `processImport`
  ###
  isolated: false

  _render: (str, options) ->
    compile => (new @engine(options)).minify(str)

  # private

  compile = (fn) ->
    try res = fn()
    catch err then return W.reject(err)
    W.resolve(res)

module.exports = MinifyCSS
