(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Sheep.
Section Sheep.
  Record t : Set := {
    naked : bool.t;
    name : ref str.t;
  }.
  
  Global Instance Get_naked : Notations.Dot "naked" := {
    Notations.dot :=
      Ref.map (fun x => x.(naked)) (fun v x => x <| naked := v |>);
  }.
  Global Instance Get_AF_naked : Notations.DoubleColon t "naked" := {
    Notations.double_colon (x : M.Val t) := x.["naked"];
  }.
  Global Instance Get_name : Notations.Dot "name" := {
    Notations.dot := Ref.map (fun x => x.(name)) (fun v x => x <| name := v |>);
  }.
  Global Instance Get_AF_name : Notations.DoubleColon t "name" := {
    Notations.double_colon (x : M.Val t) := x.["name"];
  }.
End Sheep.
End Sheep.

Module  Animal.
Section Animal.
  Class Trait (Self : Set) : Type := {
    new : (ref str.t) -> M ltac:(Self);
    name : (ref ltac:(Self)) -> M (ref str.t);
    noise : (ref ltac:(Self)) -> M (ref str.t);
  }.
  
End Animal.
End Animal.

Module  Impl_traits_Sheep_t.
Section Impl_traits_Sheep_t.
  Ltac Self := exact traits.Sheep.t.
  
  (*
      fn is_naked(&self) -> bool {
          self.naked
      }
  *)
  Definition is_naked (self : ref ltac:(Self)) : M bool.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref traits.Sheep.t := M.read self in
    M.read (deref α0).["naked"].
  
  Global Instance AssociatedFunction_is_naked :
    Notations.DoubleColon ltac:(Self) "is_naked" := {
    Notations.double_colon := is_naked;
  }.
End Impl_traits_Sheep_t.
End Impl_traits_Sheep_t.

Module  Impl_traits_Animal_for_traits_Sheep_t.
Section Impl_traits_Animal_for_traits_Sheep_t.
  Ltac Self := exact traits.Sheep.t.
  
  (*
      fn new(name: &'static str) -> Sheep {
          Sheep {
              name: name,
              naked: false,
          }
      }
  *)
  Definition new (name : ref str.t) : M traits.Sheep.t :=
    let* name : M.Val (ref str.t) := M.alloc name in
    let* α0 : ref str.t := M.read name in
    M.pure {| traits.Sheep.name := α0; traits.Sheep.naked := false; |}.
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      fn name(&self) -> &'static str {
          self.name
      }
  *)
  Definition name (self : ref ltac:(Self)) : M (ref str.t) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref traits.Sheep.t := M.read self in
    M.read (deref α0).["name"].
  
  Global Instance AssociatedFunction_name :
    Notations.DoubleColon ltac:(Self) "name" := {
    Notations.double_colon := name;
  }.
  
  (*
      fn noise(&self) -> &'static str {
          if self.is_naked() {
              "baaaaah?"
          } else {
              "baaaaah!"
          }
      }
  *)
  Definition noise (self : ref ltac:(Self)) : M (ref str.t) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref traits.Sheep.t := M.read self in
    let* α1 : bool.t := traits.Sheep.t::["is_naked"] α0 in
    let* α2 : M.Val (ref str.t) :=
      if (use α1 : bool) then
        M.pure (mk_str "baaaaah?")
      else
        M.pure (mk_str "baaaaah!") in
    M.read α2.
  
  Global Instance AssociatedFunction_noise :
    Notations.DoubleColon ltac:(Self) "noise" := {
    Notations.double_colon := noise;
  }.
  
  (*
      fn talk(&self) {
          // For example, we can add some quiet contemplation.
          println!("{} pauses briefly... {}", self.name, self.noise());
      }
  *)
  Definition talk (self : ref ltac:(Self)) : M unit :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str ""; mk_str " pauses briefly... "; mk_str "
" ] in
        let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
        let* α2 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α1) in
        let* α3 : ref traits.Sheep.t := M.read self in
        let* α4 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"]
            (borrow (deref α3).["name"]) in
        let* α5 : M.Val core.fmt.rt.Argument.t := M.alloc α4 in
        let* α6 : ref traits.Sheep.t := M.read self in
        let* α7 : ref str.t :=
          (traits.Animal.noise
              (Self := traits.Sheep.t)
              (Trait := ltac:(refine _)))
            α6 in
        let* α8 : M.Val (ref str.t) := M.alloc α7 in
        let* α9 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] (borrow α8) in
        let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
        let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α5; α10 ] in
        let* α12 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
          M.alloc (borrow α11) in
        let* α13 : ref (slice core.fmt.rt.Argument.t) :=
          M.read (pointer_coercion "Unsize" α12) in
        let* α14 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α2 α13 in
        let* α15 : unit := std.io.stdio._print α14 in
        M.alloc α15 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_talk :
    Notations.DoubleColon ltac:(Self) "talk" := {
    Notations.double_colon := talk;
  }.
  
  Global Instance ℐ : traits.Animal.Required.Trait ltac:(Self) := {
    traits.Animal.new := new;
    traits.Animal.name := name;
    traits.Animal.noise := noise;
    traits.Animal.talk := Datatypes.Some talk;
  }.
End Impl_traits_Animal_for_traits_Sheep_t.
End Impl_traits_Animal_for_traits_Sheep_t.

Module  Impl_traits_Sheep_t_2.
Section Impl_traits_Sheep_t_2.
  Ltac Self := exact traits.Sheep.t.
  
  (*
      fn shear(&mut self) {
          if self.is_naked() {
              // Implementor methods can use the implementor's trait methods.
              println!("{} is already naked...", self.name());
          } else {
              println!("{} gets a haircut!", self.name);
  
              self.naked = true;
          }
      }
  *)
  Definition shear (self : mut_ref ltac:(Self)) : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* α0 : mut_ref traits.Sheep.t := M.read self in
    let* α1 : bool.t := traits.Sheep.t::["is_naked"] (borrow (deref α0)) in
    let* α2 : M.Val unit :=
      if (use α1 : bool) then
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : M.Val (array (ref str.t)) :=
              M.alloc [ mk_str ""; mk_str " is already naked...
" ] in
            let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
            let* α2 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α1) in
            let* α3 : mut_ref traits.Sheep.t := M.read self in
            let* α4 : ref str.t :=
              (traits.Animal.name
                  (Self := traits.Sheep.t)
                  (Trait := ltac:(refine _)))
                (borrow (deref α3)) in
            let* α5 : M.Val (ref str.t) := M.alloc α4 in
            let* α6 : core.fmt.rt.Argument.t :=
              core.fmt.rt.Argument.t::["new_display"] (borrow α5) in
            let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
            let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
            let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc (borrow α8) in
            let* α10 : ref (slice core.fmt.rt.Argument.t) :=
              M.read (pointer_coercion "Unsize" α9) in
            let* α11 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_v1"] α2 α10 in
            let* α12 : unit := std.io.stdio._print α11 in
            M.alloc α12 in
          M.alloc tt in
        M.alloc tt
      else
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : M.Val (array (ref str.t)) :=
              M.alloc [ mk_str ""; mk_str " gets a haircut!
" ] in
            let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
            let* α2 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α1) in
            let* α3 : mut_ref traits.Sheep.t := M.read self in
            let* α4 : core.fmt.rt.Argument.t :=
              core.fmt.rt.Argument.t::["new_display"]
                (borrow (deref α3).["name"]) in
            let* α5 : M.Val core.fmt.rt.Argument.t := M.alloc α4 in
            let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
            let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc (borrow α6) in
            let* α8 : ref (slice core.fmt.rt.Argument.t) :=
              M.read (pointer_coercion "Unsize" α7) in
            let* α9 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_v1"] α2 α8 in
            let* α10 : unit := std.io.stdio._print α9 in
            M.alloc α10 in
          M.alloc tt in
        let* _ : M.Val unit :=
          let* α0 : mut_ref traits.Sheep.t := M.read self in
          assign (deref α0).["naked"] true in
        M.alloc tt in
    M.read α2.
  
  Global Instance AssociatedFunction_shear :
    Notations.DoubleColon ltac:(Self) "shear" := {
    Notations.double_colon := shear;
  }.
End Impl_traits_Sheep_t_2.
End Impl_traits_Sheep_t_2.

(*
fn main() {
    // Type annotation is necessary in this case.
    let mut dolly: Sheep = Animal::new("Dolly");
    // TODO ^ Try removing the type annotations.

    dolly.talk();
    dolly.shear();
    dolly.talk();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* dolly : M.Val traits.Sheep.t :=
    let* α0 : ref str.t := M.read (mk_str "Dolly") in
    let* α1 : traits.Sheep.t :=
      (traits.Animal.new (Self := traits.Sheep.t) (Trait := ltac:(refine _)))
        α0 in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      (traits.Animal.talk (Self := traits.Sheep.t) (Trait := ltac:(refine _)))
        (borrow dolly) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : unit := traits.Sheep.t::["shear"] (borrow_mut dolly) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      (traits.Animal.talk (Self := traits.Sheep.t) (Trait := ltac:(refine _)))
        (borrow dolly) in
    M.alloc α0 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.