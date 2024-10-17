open Foundation
open AppKit
open Runtime
open Printf

let viewDidLoad =
  Method.define
    ~cmd: (selector "viewDidLoad")
    ~args: Objc_t.noargs
    ~return: Objc_t.void @@
    fun self cmd ->
      msg_super ~self cmd ~args: Objc_t.noargs ~return: Objc_t.void;
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
