open AppKit

let main () =
  let _ = AppDelegate.define ()
  and _ = ViewController.define ()
  and argc = Array.length Sys.argv
  and argv =
    Sys.argv
    |> Array.to_list
    |> Objc.(CArray.of_list string)
    |> Objc.CArray.start
  in
  _NSApplicationMain argc argv |> exit

let () = main ()