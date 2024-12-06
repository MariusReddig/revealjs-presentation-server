# Presentation server using reveal.js
This repo contains structure for a custom server for presentations.

# Commands:
 - build.sh -> creates the server and links the presentations to it
 - start.sh -> starts the server at port 8080
 - clean.sh -> removes the reveal folder containing the current server

# Usage:
The presentations should be inserted into the presentations folder using the following structure:

```
revealjs-presentation-server
└─ presentations
   ├─ presentation1
   │  └─index.html
   │
   └─ presentation2
      └─index.html
```

Index.html must contain the presentation and is essential for linking it to the server.
