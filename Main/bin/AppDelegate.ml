open AppKit
open Printf

let define () =
  Class.define "AppDelegate"
    ~superclass: NSResponder.self
    ~methods:
      [ NSApplicationDelegate.applicationDidFinishLaunching' @@
          fun _self _cmd _notif ->
            eprintf "Launched...\n%!"
      ]
