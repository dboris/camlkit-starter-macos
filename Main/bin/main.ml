open AppKit
open Runtime

let main () =
  let delegate = AppDelegate.define ()
  and _ = ViewController.define ()
  and app = NSApplication.self |> NSApplicationClass.sharedApplication
  and argc = Array.length Sys.argv
  and argv =
    Sys.argv
    |> Array.to_list
    |> Objc.(CArray.of_list string)
    |> Objc.CArray.start
  in
  app
  |> NSApplication.setActivationPolicy _NSApplicationActivationPolicyRegular
  |> ignore;
  app |> NSApplication.setDelegate delegate;
  app |> NSApplication.activateIgnoringOtherApps true;

  _NSApplicationMain argc argv |> exit

let () = main ()