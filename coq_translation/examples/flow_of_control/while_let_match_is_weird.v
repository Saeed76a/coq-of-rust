(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let optional := Some 0 in
  loop
    match optional with
    | Some i =>
      let* α0 := i.["gt"] 9 in
      if (α0 : bool) then
        let* _ :=
          let* _ :=
            let* α0 :=
              format_arguments::["new_const"]
                (addr_of [ "Greater than 9, quit!
" ]) in
            _crate.io._print α0 in
          Pure tt in
        let* _ := assign optional None in
        Pure tt
      else
        let* _ :=
          let* _ :=
            let* α0 := format_argument::["new_debug"] (addr_of i) in
            let* α1 :=
              format_arguments::["new_v1"]
                (addr_of [ "`i` is `"; "`. Try again.
" ])
                (addr_of [ α0 ]) in
            _crate.io._print α1 in
          Pure tt in
        let* _ :=
          let* α0 := i.["add"] 1 in
          assign optional (Some α0) in
        Pure tt
    | _ =>
      let _ := Break in
      Pure tt
    end
    from
    loop.