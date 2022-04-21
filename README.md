# purs-nanoid
A tiny, secure, URL-friendly, unique string ID generator. Now available in PureScript.

This library uses `random` which is a direct wrapper around JavaScript's `Math.random()`, so I don't know how secure this is, but it's still useful for generating urls. And unless you are generating a very large amount of ids per second you shouldn't have problems.

Feel free to contribute. 