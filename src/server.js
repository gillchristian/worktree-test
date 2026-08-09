// Minimal dependency-free server. It exists so `wtx ports` has a listener to
// attribute to a checkout — attribution is by the process's cwd, not the port.
const http = require('http')
const port = Number(process.env.PORT || process.argv[process.argv.indexOf('--port') + 1] || 4311)

http
  .createServer((_req, res) => {
    res.writeHead(200, { 'content-type': 'text/plain' })
    res.end(`worktree-test @ ${process.cwd()}\n`)
  })
  .listen(port, () => console.log(`listening on :${port} from ${process.cwd()}`))
