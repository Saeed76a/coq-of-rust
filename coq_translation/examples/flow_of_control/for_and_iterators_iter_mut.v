(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let* names :=
    let* α0 := _crate.boxed.Box::["new"] [ "Bob"; "Frank"; "Ferris" ] in
    Slice::["into_vec"] α0 in
  let* _ :=
    let* α0 := names.["iter_mut"] in
    let* α1 := LangItem α0 in
    match α1 with
    | iter =>
      loop
        let* _ :=
          let* α0 := LangItem (addr_of iter) in
          match α0 with
          | None => Pure Break
          | Some {| Some.0 := name; |} =>
            let* α0 :=
              match name with
              | "Ferris" => Pure "There is a rustacean among us!"
              | _ => Pure "Hello"
              end in
            assign name.["deref"] α0
          end in
        Pure tt
        from
        for
    end in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of names) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "names: "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt in
  Pure tt.