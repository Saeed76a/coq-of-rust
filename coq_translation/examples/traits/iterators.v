(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Fibonacci.
  Record t : Set := {
    curr : u32;
    next : u32;
  }.
  
  Global Instance Get_curr : Notation.Dot "curr" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_next : Notation.Dot "next" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Fibonacci.
Definition Fibonacci : Set := Fibonacci.t.

Module Impl_Iterator_for_Fibonacci.
  Definition Self := Fibonacci.
  
  Definition Item : Set := u32.
  
  Definition next (self : mut_ref Self) : M (Option ImplSelf.Item) :=
    let current := self.["curr"] in
    let* _ := assign self.["curr"] self.["next"] in
    let* _ :=
      let* α0 := current.["add"] self.["next"] in
      assign self.["next"] α0 in
    Pure (Some current).
  
  Global Instance Method_next : Notation.Dot "next" := {
    Notation.dot := next;
  }.
  
  Global Instance I : Iterator.Trait Self := {
    Iterator.next := next;
  }.
End Impl_Iterator_for_Fibonacci.

Definition fibonacci (_ : unit) : M Fibonacci :=
  Pure {| Fibonacci.curr := 0; Fibonacci.next := 1; |}.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let sequence := Range {| Range.start := 0; Range.end := 3; |} in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "Four consecutive `next` calls on 0..3
" ]) in
      _crate.io._print α0 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := sequence.["next"] in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"] (addr_of [ "> "; "
" ]) (addr_of [ α1 ]) in
      _crate.io._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := sequence.["next"] in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"] (addr_of [ "> "; "
" ]) (addr_of [ α1 ]) in
      _crate.io._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := sequence.["next"] in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"] (addr_of [ "> "; "
" ]) (addr_of [ α1 ]) in
      _crate.io._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := sequence.["next"] in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"] (addr_of [ "> "; "
" ]) (addr_of [ α1 ]) in
      _crate.io._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "Iterate through 0..3 using `for`
" ]) in
      _crate.io._print α0 in
    Pure tt in
  let* _ :=
    let* α0 := LangItem Range {| Range.start := 0; Range.end := 3; |} in
    match α0 with
    | iter =>
      loop
        let* _ :=
          let* α0 := LangItem (addr_of iter) in
          match α0 with
          | None => Pure Break
          | Some {| Some.0 := i; |} =>
            let* _ :=
              let* _ :=
                let* α0 := format_argument::["new_display"] (addr_of i) in
                let* α1 :=
                  format_arguments::["new_v1"]
                    (addr_of [ "> "; "
" ])
                    (addr_of [ α0 ]) in
                _crate.io._print α1 in
              Pure tt in
            Pure tt
          end in
        Pure tt
        from
        for
    end in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of
            [ "The first four terms of the Fibonacci sequence are: 
" ]) in
      _crate.io._print α0 in
    Pure tt in
  let* _ :=
    let* α0 := fibonacci tt in
    let* α1 := α0.["take"] 4 in
    let* α2 := LangItem α1 in
    match α2 with
    | iter =>
      loop
        let* _ :=
          let* α0 := LangItem (addr_of iter) in
          match α0 with
          | None => Pure Break
          | Some {| Some.0 := i; |} =>
            let* _ :=
              let* _ :=
                let* α0 := format_argument::["new_display"] (addr_of i) in
                let* α1 :=
                  format_arguments::["new_v1"]
                    (addr_of [ "> "; "
" ])
                    (addr_of [ α0 ]) in
                _crate.io._print α1 in
              Pure tt in
            Pure tt
          end in
        Pure tt
        from
        for
    end in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of
            [ "The next four terms of the Fibonacci sequence are: 
" ]) in
      _crate.io._print α0 in
    Pure tt in
  let* _ :=
    let* α0 := fibonacci tt in
    let* α1 := α0.["skip"] 4 in
    let* α2 := α1.["take"] 4 in
    let* α3 := LangItem α2 in
    match α3 with
    | iter =>
      loop
        let* _ :=
          let* α0 := LangItem (addr_of iter) in
          match α0 with
          | None => Pure Break
          | Some {| Some.0 := i; |} =>
            let* _ :=
              let* _ :=
                let* α0 := format_argument::["new_display"] (addr_of i) in
                let* α1 :=
                  format_arguments::["new_v1"]
                    (addr_of [ "> "; "
" ])
                    (addr_of [ α0 ]) in
                _crate.io._print α1 in
              Pure tt in
            Pure tt
          end in
        Pure tt
        from
        for
    end in
  let array := [ 1; 3; 3; 7 ] in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of (addr_of array)) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Iterate the following array "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt in
  let* α0 := array.["iter"] in
  let* α1 := LangItem α0 in
  match α1 with
  | iter =>
    loop
      let* _ :=
        let* α0 := LangItem (addr_of iter) in
        match α0 with
        | None => Pure Break
        | Some {| Some.0 := i; |} =>
          let* _ :=
            let* _ :=
              let* α0 := format_argument::["new_display"] (addr_of i) in
              let* α1 :=
                format_arguments::["new_v1"]
                  (addr_of [ "> "; "
" ])
                  (addr_of [ α0 ]) in
              _crate.io._print α1 in
            Pure tt in
          Pure tt
        end in
      Pure tt
      from
      for
  end.