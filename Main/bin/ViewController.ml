open AppKit
open Printf

let viewDidLoad =
  NSViewControllerMethods.viewDidLoad @@
    fun self cmd ->
      msg_super cmd ~self ~args: Objc_type.noargs ~return: Objc_type.void;
      eprintf "viewDidLoad...\n%!";
      let v =
        NSView.self |> alloc
        |> NSView.initWithFrame
          (CGRect.make ~x: 100. ~y: 100. ~width: 60. ~height: 60.)
      in
      v |> NSView.setBackgroundColor (NSColor.self |> NSColorClass.redColor);
      self |> NSViewController.view |> NSView.addSubview v


let define () =
  Class.define "ViewController"
    ~superclass: NSViewController.self
    ~methods: [ viewDidLoad ]
