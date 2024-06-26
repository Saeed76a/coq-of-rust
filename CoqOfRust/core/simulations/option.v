Require Import CoqOfRust.CoqOfRust.
Require Import simulations.M.
Require CoqOfRust.core.simulations.default.
Import simulations.M.Notations.

Module Impl_Option_T.
  Definition Self (T : Set) : Set :=
    option T.

  Definition unwrap_or_default {T : Set}
      {_ : core.simulations.default.Default.Trait T}
      (self : Self T) :
      T :=
    match self with
    | None => core.simulations.default.Default.default (Self := T)
    | Some x => x
    end.

  Definition expect {State A : Set}
    (self : option A) (msg : string) : MS? State string A :=
    match self with
    | None => panicS? msg
    | Some x => returnS? x
    end.

  Definition unwrap {State A : Set}
    (self : option A) : MS? State string A :=
    expect self "".
End Impl_Option_T.

Module Impl_Default_for_Option_T.
  Global Instance I (T : Set) :
      core.simulations.default.Default.Trait (option T) := {
    default := None;
  }.
End Impl_Default_for_Option_T.