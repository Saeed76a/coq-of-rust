(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module ParseIntError := std.num.ParseIntError.
Definition ParseIntError := ParseIntError.t.

Definition multiply
    (first_number_str : ref str)
    (second_number_str : ref str)
    : M (Result i32 ParseIntError) :=
  let* first_number :=
    let* α0 := first_number_str.["parse"] in
    match α0 with
    | Ok first_number => Pure first_number
    | Err e => Return (Err e)
    end in
  let* second_number :=
    let* α0 := second_number_str.["parse"] in
    match α0 with
    | Ok second_number => Pure second_number
    | Err e => Return (Err e)
    end in
  let* α0 := first_number.["mul"] second_number in
  Pure (Ok α0).

Definition print (result : Result i32 ParseIntError) : M unit :=
  match result with
  | Ok n =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of n) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "n is "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt
  | Err e =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of e) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Error: "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let* _ :=
    let* α0 := multiply "10" "2" in
    print α0 in
  let* _ :=
    let* α0 := multiply "t" "2" in
    print α0 in
  Pure tt.