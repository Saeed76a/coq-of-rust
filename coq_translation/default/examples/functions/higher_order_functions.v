(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition is_odd `{H : State.Trait} (n : u32) : M (H := H) bool :=
  let* α0 := n.["rem"] 2 in
  α0.["eq"] 1.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of
            [ "Find the sum of all the squared odd numbers under 1000
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let upper := 1000 in
  let acc := 0 in
  let* _ :=
    let* α0 :=
      LanguageItem.RangeFrom {| LanguageItem.RangeFrom.start := 0;
        |}.["into_iter"] in
    match α0 with
    | iter =>
      loop
        (let* _ :=
          let* α0 := (addr_of iter).["next"] in
          match α0 with
          | core.option.Option.None  => Break
          | core.option.Option.Some n =>
            let* n_squared := n.["mul"] n in
            let* α0 := n_squared.["ge"] upper in
            if (α0 : bool) then
              let* _ := Break in
              Pure tt
            else
              let* α0 := higher_order_functions.is_odd n_squared in
              if (α0 : bool) then
                let* _ := acc.["add_assign"] n_squared in
                Pure tt
              else
                Pure tt
          end in
        Pure tt)
    end in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of acc) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "imperative style: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* sum_of_squared_odd_numbers :=
    let* α0 :=
      LanguageItem.RangeFrom {| LanguageItem.RangeFrom.start := 0; |}.["map"]
        (fun n => n.["mul"] n) in
    let* α1 := α0.["take_while"] (fun n_squared => n_squared.["lt"] upper) in
    let* α2 :=
      α1.["filter"]
        (fun n_squared => higher_order_functions.is_odd n_squared) in
    α2.["sum"] in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_display"] (addr_of sum_of_squared_odd_numbers) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "functional style: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.