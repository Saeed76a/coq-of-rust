(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn elided_input(x: &i32) {
    println!("`elided_input`: {}", x);
}
*)
Definition elided_input (x : ref i32.t) : M unit :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "`elided_input`: "; mk_str "
" ] in
      let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
      let* α2 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α1) in
      let* α3 : core.fmt.rt.Argument.t :=
        core.fmt.rt.Argument.t::["new_display"] (borrow x) in
      let* α4 : M.Val core.fmt.rt.Argument.t := M.alloc α3 in
      let* α5 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α4 ] in
      let* α6 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α5) in
      let* α7 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α6) in
      let* α8 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_v1"] α2 α7 in
      let* α9 : unit := std.io.stdio._print α8 in
      M.alloc α9 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn annotated_input<'a>(x: &'a i32) {
    println!("`annotated_input`: {}", x);
}
*)
Definition annotated_input (x : ref i32.t) : M unit :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "`annotated_input`: "; mk_str "
" ] in
      let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
      let* α2 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α1) in
      let* α3 : core.fmt.rt.Argument.t :=
        core.fmt.rt.Argument.t::["new_display"] (borrow x) in
      let* α4 : M.Val core.fmt.rt.Argument.t := M.alloc α3 in
      let* α5 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α4 ] in
      let* α6 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α5) in
      let* α7 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α6) in
      let* α8 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_v1"] α2 α7 in
      let* α9 : unit := std.io.stdio._print α8 in
      M.alloc α9 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn elided_pass(x: &i32) -> &i32 {
    x
}
*)
Definition elided_pass (x : ref i32.t) : M (ref i32.t) :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  M.read x.

(*
fn annotated_pass<'a>(x: &'a i32) -> &'a i32 {
    x
}
*)
Definition annotated_pass (x : ref i32.t) : M (ref i32.t) :=
  let* x : M.Val (ref i32.t) := M.alloc x in
  M.read x.

(*
fn main() {
    let x = 3;

    elided_input(&x);
    annotated_input(&x);

    println!("`elided_pass`: {}", elided_pass(&x));
    println!("`annotated_pass`: {}", annotated_pass(&x));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* x : M.Val i32.t := M.alloc (Integer.of_Z 3) in
  let* _ : M.Val unit :=
    let* α0 : unit := scoping_rules_lifetimes_elision.elided_input (borrow x) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      scoping_rules_lifetimes_elision.annotated_input (borrow x) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "`elided_pass`: "; mk_str "
" ] in
      let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
      let* α2 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α1) in
      let* α3 : ref i32.t :=
        scoping_rules_lifetimes_elision.elided_pass (borrow x) in
      let* α4 : M.Val (ref i32.t) := M.alloc α3 in
      let* α5 : core.fmt.rt.Argument.t :=
        core.fmt.rt.Argument.t::["new_display"] (borrow α4) in
      let* α6 : M.Val core.fmt.rt.Argument.t := M.alloc α5 in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α7) in
      let* α9 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α8) in
      let* α10 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_v1"] α2 α9 in
      let* α11 : unit := std.io.stdio._print α10 in
      M.alloc α11 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "`annotated_pass`: "; mk_str "
" ] in
      let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
      let* α2 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α1) in
      let* α3 : ref i32.t :=
        scoping_rules_lifetimes_elision.annotated_pass (borrow x) in
      let* α4 : M.Val (ref i32.t) := M.alloc α3 in
      let* α5 : core.fmt.rt.Argument.t :=
        core.fmt.rt.Argument.t::["new_display"] (borrow α4) in
      let* α6 : M.Val core.fmt.rt.Argument.t := M.alloc α5 in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α7) in
      let* α9 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α8) in
      let* α10 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_v1"] α2 α9 in
      let* α11 : unit := std.io.stdio._print α10 in
      M.alloc α11 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.