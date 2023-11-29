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
  Parameter is_naked : (ref ltac:(Self)) -> M bool.t.
  
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
  Parameter new : (ref str.t) -> M traits.Sheep.t.
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      fn name(&self) -> &'static str {
          self.name
      }
  *)
  Parameter name : (ref ltac:(Self)) -> M (ref str.t).
  
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
  Parameter noise : (ref ltac:(Self)) -> M (ref str.t).
  
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
  Parameter talk : (ref ltac:(Self)) -> M unit.
  
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
  Parameter shear : (mut_ref ltac:(Self)) -> M unit.
  
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
Parameter main : M unit.