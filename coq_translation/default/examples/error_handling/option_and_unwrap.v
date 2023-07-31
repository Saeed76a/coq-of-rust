(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition give_adult
    `{H : State.Trait}
    (drink : core.option.Option (ref str))
    : M (H := H) unit :=
  match drink with
  | core.option.Option.Some "lemonade" =>
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "Yuck! Too sugary.
" ]) in
      std.io.stdio._print α0 in
    Pure tt
  | core.option.Option.Some inner =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of inner) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ ""; "? How nice.
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt
  | core.option.Option.None =>
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "No drink? Oh well.
" ]) in
      std.io.stdio._print α0 in
    Pure tt
  end.

Definition drink
    `{H : State.Trait}
    (drink : core.option.Option (ref str))
    : M (H := H) unit :=
  let* inside := drink.["unwrap"] in
  let* _ :=
    let* α0 := inside.["eq"] "lemonade" in
    if (α0 : bool) then
      let* _ := std.panicking.begin_panic "AAAaaaaa!!!!" in
      Pure tt
    else
      Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of inside) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "I love "; "s!!!!!
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let water := core.option.Option.Some "water" in
  let lemonade := core.option.Option.Some "lemonade" in
  let void := core.option.Option.None in
  let* _ := option_and_unwrap.give_adult water in
  let* _ := option_and_unwrap.give_adult lemonade in
  let* _ := option_and_unwrap.give_adult void in
  let coffee := core.option.Option.Some "coffee" in
  let nothing := core.option.Option.None in
  let* _ := option_and_unwrap.drink coffee in
  let* _ := option_and_unwrap.drink nothing in
  Pure tt.